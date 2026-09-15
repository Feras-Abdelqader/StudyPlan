import 'package:firstproject/HomePage.dart';
import 'package:flutter/material.dart';
import 'Login.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final k = GlobalKey<FormState>();
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();
  bool ic2=true;
  bool ic1=true;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(title: Text("StudyPlan",style: TextStyle(fontSize: 20),),centerTitle: true,),
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
                Text("Sign Up",style: TextStyle(fontSize: 50),),
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
                      prefix: Icon(Icons.email),
                      label: Text("Email"),
                    ),
                    controller: c2,
                    validator: v2,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> home(c1.text)));
                  });
                }, child: Text("Sign Up")),
                SizedBox(height: 10,),
                TextButton(onPressed: (){
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                  });
                }, child: Text("Already have account"))
              ],
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
    return "More than one word";
  }
}

String? v2(String? n) {
  if (n != null && n.contains("@")) {
    return null;
  } else {
    return "Not Email";
  }
}

String? v3(String? n) {
  if (n != null && n.length > 8) {
    return null;
  } else {
    return "Invalid Password";
  }
}

String? v4(String? n) {
  if (n != null && n == c3.text) {
    return null;
  } else {
    return "Doesnt Match";
  }
}
}
