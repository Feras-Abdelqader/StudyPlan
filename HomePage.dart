import 'package:firstproject/Login.dart';
import 'package:flutter/material.dart';
import 'ChangeProfileData.dart';
import 'Study.dart';
import 'Settings.dart';
class home extends StatefulWidget {
  final String username;
  const home(this.username,{super.key});

  @override
  State<home> createState() => _homeState(username);
}

class _homeState extends State<home> {
  final String username;
  _homeState(this.username);
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(title: Text("StudyPlan",style: TextStyle(fontSize: 20),),centerTitle: true,),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 1000,
                decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
                ),
                padding: EdgeInsets.all(30),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome $username!"  ,style: TextStyle(fontSize: 40, color: Colors.black),),
                    Text("What would u like to do next?" ,style: TextStyle(fontSize: 40, color: Colors.grey),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            width: 400,
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.account_circle),
                                    SizedBox(width: 10,),
                                    Text("Change Profile Data")
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: (){
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>study()));
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            width: 400,
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.book),
                                    SizedBox(width: 10,),
                                    Text("Focus Session"),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        GestureDetector(
                          onTap: (){
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>settings()));
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            width: 400,
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.settings),
                                    SizedBox(width: 10,),
                                    Text("Settings"),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: (){
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            width: 400,
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.logout),
                                    SizedBox(width: 10,),
                                    Text("Logout"),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),

          ],
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
