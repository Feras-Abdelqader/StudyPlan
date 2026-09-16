import 'dart:js_interop';

import 'package:firstproject/main.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final k = GlobalKey<FormState>();
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  bool ic1 = true;
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar:AppBar(title: Text("StudyPlan",style: TextStyle(fontSize: 20),),centerTitle: true,),
        body:
        Center(
          child: Container(
            padding: EdgeInsets.all(40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            width: 400,
            child: Form(
              key: k,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Login",style: TextStyle(fontSize: 50),),
                  SizedBox(height: 40,),
                  SizedBox(
                    width: 250,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefix: Icon(Icons.face),
                        label: Text("Username"),
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
                          prefix: Icon(Icons.lock),
                          label: Text("Password"),
                          suffix: IconButton(onPressed: (){
                            setState(() {
                              ic1=!ic1;
                            });
                          }, icon: Icon(ic1?Icons.visibility:Icons.visibility_off))
                      ),
                      controller: c2,
                      validator: v2,
                      obscureText: ic1,
                    ),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      if(k.currentState!.validate())
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> home(c1.text) ));
                    });
                  }, child: Text("Login")),
                  SizedBox(height: 10,),
                  TextButton(onPressed: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                    });
                  }, child: Text("Doens't have account"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  String? v1(String? n) {
    if (n != null && !n.contains(" ")) {
      return null;
    } else {
      return "Invalid Username";
    }
  }

  String? v2(String? n) {
    if (n != null && n.length > 8) {
      return null;
    } else {
      return "Invalid Password";
    }
  }
}

