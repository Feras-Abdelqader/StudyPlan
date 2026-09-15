import 'package:flutter/material.dart';
import 'Login.dart';
import 'HomePage.dart';
import 'Study.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{
  final k = GlobalKey<FormState>();
  TextEditingController c1 =TextEditingController();
  TextEditingController c2 =TextEditingController();
  TextEditingController c3 =TextEditingController();
  TextEditingController c4 =TextEditingController();
  bool ic2=true;
  bool ic1=true;
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(title: Text("StudyPlan",style: TextStyle(fontSize: 20),),centerTitle: true,),
        body:Center(
          child: Form(
            key: k,
            child: Container(
              width: 450,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
              ),
              padding: EdgeInsets.all(15),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.account_circle,size: 70,),

                  Text("Change Profile Data",style: TextStyle(fontSize: 30),),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: 250,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Username"),
                        prefix: Icon(Icons.face)
                      ),
                      controller: c1,
                      validator: v1,
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: 250,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Email"),
                          prefix: Icon(Icons.email)
                      ),
                      controller: c2,
                      validator: v2,
                    ),
                  ),SizedBox(height: 20,),
                  SizedBox(
                    width: 250,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefix: Icon(Icons.lock),
                          label: Text("Password"),
                          suffix: IconButton(onPressed: (){
                            setState(() {
                              ic1=!ic1;
                            });
                          }, icon: Icon(ic1?Icons.visibility:Icons.visibility_off))
                      ),
                      controller: c3,
                      validator:v3,
                      obscureText: ic1,
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: 250,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefix: Icon(Icons.lock),
                          label: Text("Confirmation Password"),
                          suffix: IconButton(onPressed: (){setState(() {
                            ic2=!ic2;
                          });}, icon: Icon(ic2?Icons.visibility:Icons.visibility_off))
                      ),
                      controller: c4,
                      validator:v4,
                      obscureText: ic2,
                    ),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      if(k.currentState!.validate())
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>home(c1.text)));
                    });
                  }, child: Text("Save"))
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
              },),
              ListTile(title: Text("Change Profile Data"),onTap: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                });
              },),
              ListTile(title: Text("Focus Session"),onTap: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>study()));
                });
              },),
              ListTile(title: Text("Settings"),onTap: (){
                setState(() {

                });
              },),
              ListTile(title: Text("Logout"),onTap: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                });
              },),
            ],
          ),
        ),
      ),
    );
  }
  String? v1(String? n){

    if(n==null)
      return null;
    else if(n!=null && !n.contains(" ")){
      return null;
    }
      else
        return "Invalid Username";
    }
  String? v2(String? n) {
    if (n == null || n.trim().isEmpty) {
      return null;
    } else if (n.contains("@")) {
      return null;
    } else {
      return "Not Email";
    }
  }

  String? v3(String? n) {
    if (n == null || n.trim().isEmpty) {
      return null;
    } else if (n.length > 8) {
      return null;
    } else {
      return "Invalid Password";
    }
  }

  String? v4(String? n) {
    if (n == null || n.trim().isEmpty) {
      return null;
    } else if (n == c3.text) {
      return null;
    } else {
      return "Doesnt Match";
    }
  }

  }

