import 'package:flutter/material.dart';
import 'Login.dart';
import 'HomePage.dart';
import 'Study.dart';
import 'ChangeProfileData.dart';
class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  bool s1 = true;
  bool s2 = true;
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(title: Text("StudyPlan",style: TextStyle(fontSize: 20),),centerTitle: true,),
        body: Center(
          child: Container(
            child: Container(
              width: 450,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
              ),
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Settings",style: TextStyle(fontSize: 30),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text("Account",style: TextStyle(fontSize: 20,),),
                  ListTile(title: Text("Change Profile Data"), onTap: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                    });
                  },
                  leading: CircleAvatar(child: Icon(Icons.account_circle),),
                  ),
                  ListTile(title: Text("Logout"), onTap: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                    });
                  },
                    leading: CircleAvatar(child: Icon(Icons.logout),),
                  ),
                  SizedBox(height: 10,),
                  Text("Preferences",style: TextStyle(fontSize: 20),),
                  ListTile(
                    title: Text("Notification"),
                    leading: CircleAvatar(child: Icon(Icons.notifications),),
                    trailing: Switch(value: s1, onChanged: (s){
                      setState(() {
                        s1 = s;
                      });
                    }),
                  ),
                  ListTile(
                    title: Text("Sound"),
                    leading: CircleAvatar(child: Icon(Icons.volume_up),),
                    trailing: Switch(value: s2, onChanged: (s){
                      setState(() {
                        s2 = s;
                      });
                    }),
                  ),
                ],
              ),
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
      )

    );

  }
}
