import 'package:flutter/material.dart';
import 'Login.dart';
import 'HomePage.dart';
import 'ChangeProfileData.dart';
import 'Settings.dart';
class study extends StatefulWidget {
  const study({super.key});

  @override
  State<study> createState() => _studyState();
}

class _studyState extends State<study> with SingleTickerProviderStateMixin {
  late AnimationController c;
  late Animation<double> a;
  TextEditingController c1 = TextEditingController();
  int x =25;
  @override
  void initState() {
    super.initState();
    c = AnimationController(
      duration:  Duration(minutes:x),
      vsync: this,
    );

    // 25 minutes = 1500 seconds down to 0
    a = Tween<double>(begin: 1500, end: 0).animate(c);
  }

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(title: Text("StudyPlan",style: TextStyle(fontSize: 20),),centerTitle: true,),
        body: Center(
          child: Container(
            width: 450,
            padding:  EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Focus Session",style: TextStyle(fontSize: 50),),
                Text("Study smarter with timed focus intervals",style: TextStyle(fontSize: 15),),
                SizedBox(height: 20,),
                AnimatedBuilder(
                  animation: a,
                  builder: (context, child) {
                    int totalSeconds = a.value.toInt();
                    int minutes = totalSeconds ~/ 60;
                    int seconds = totalSeconds % 60;

                    String formattedTime =
                        '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

                    return Text(
                      formattedTime,
                      style:  TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                 SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => c.forward(),
                      child:  Text("Resume"),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => c.stop(),
                      child:  Text("Pause"),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        c.reset();
                      },
                      child:  Text("Reset"),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Change The Timer"),
                    ),
                    controller: c1,
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: () {
                    int? newMinutes = int.tryParse(c1.text);
                    if (newMinutes != null && newMinutes > 0) {
                      setState(() {
                        x = newMinutes;
                        c.duration = Duration(minutes: x);
                        a = Tween<double>(begin: (x * 60).toDouble(), end: 0).animate(c);
                        c.reset();
                      });
                    }
                  },
                  child:  Text("Change The Timer"),
                )
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration:  BoxDecoration(
                  color: Colors.lightBlue,
                ),
                child:  Center(
                  child: Text(
                    "Menu",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ListTile(title: Text("Home"),onTap: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>home("Friend")));
                });
              },
                leading: CircleAvatar(child: Icon(Icons.home),),
              ),
              ListTile(title: Text("Change Profile Data"),onTap: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                });
              },
                leading: CircleAvatar(child: Icon(Icons.account_circle),),
              ),
              ListTile(title: Text("Focus Session"),onTap: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>study()));
                });
              },
                leading: CircleAvatar(child: Icon(Icons.book),),
              ),
              ListTile(title: Text("Settings"),onTap: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>settings()));
                });
              },
                leading: CircleAvatar(child: Icon(Icons.settings),),
              ),
              ListTile(title: Text("Logout"),onTap: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                });
              },
                leading: CircleAvatar(child: Icon(Icons.logout),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}