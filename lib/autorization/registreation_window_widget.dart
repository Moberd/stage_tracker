import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home.dart';

class RegistrationWindowWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RegistrationWindowWidgetState(true);
  }
}

class RegistrationWindowWidgetState extends State<RegistrationWindowWidget> {
  bool _passwordVisible;
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController nameController = TextEditingController();

  RegistrationWindowWidgetState(bool passVis) {
    _passwordVisible = passVis;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xFFFFFFFF),
        body: Scaffold(
          body: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: 60.0, top: 120.0, right: 60.0, bottom: 60.0),
                    child: Text("Sing Up",
                        style:
                            TextStyle(fontSize: 32, color: Color(0xFF5DB075)))),

                Padding(
                    padding: EdgeInsets.only(
                        left: 60.0, top: 20.0, right: 60.0, bottom: 60.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Поле логина
                        TextFormField(
                          controller: loginController,
                          decoration: new InputDecoration(labelText: "Email"),
                          keyboardType: TextInputType.emailAddress,
                        ),

                        //Поле пароля 1
                        TextFormField(
                          controller: passwordController1,
                          obscureText: _passwordVisible,
                          decoration: new InputDecoration(
                              labelText: "Password",
                              //кнопка показа пароля
                              suffixIcon: TextButton(
                                child: Text(
                                  _passwordVisible ? "Show" : "Hide",
                                  style: TextStyle(color: Color(0xFF5DB075)),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              )),
                        ),

                        //Поле пароля 2
                        TextFormField(
                          controller: nameController,
                          decoration:
                              new InputDecoration(labelText: "Your Name"),
                        ),
                      ],
                    )),

                //Кнопка авторизации
                MaterialButton(
                    onPressed: register,
                    color: Color(0xFF5DB075),
                    minWidth: 300.0,
                    height: 45.0,
                    child: Text(
                      "Sing Up",
                      style: TextStyle(fontSize: 16),
                    ),
                    textColor: Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color(0x5DB075)),
                        borderRadius:
                            BorderRadius.all(Radius.circular(100.0)))),
                Padding(
                  padding: EdgeInsets.only(
                      left: 60.0, top: 190.0, right: 60.0, bottom: 60.0),
                  child: TextButton(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Sign In",
                        style:
                            TextStyle(fontSize: 24.0, color: Color(0xFF5DB075)),
                      ),
                    ),
                    onPressed: backToLoginPage,
                  ),
                )
              ],
            ),
          ),
        ));
  }

  bool checkPassword() {
    return true;
  }

  Future<void> register() async {
    if (checkPassword()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: loginController.text,
                password: passwordController1.text);
        CollectionReference usersFriends =
            FirebaseFirestore.instance.collection("users_friends");
        addUserFriends(usersFriends);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }


  Future<void> backToLoginPage()
  {
    Navigator.pop(context);
  }


  Future<void> addUserFriends(CollectionReference users) {
    // Call the user's CollectionReference to add a new user
    if (nameController.text.isEmpty) {
      nameController.text = "Brandon Floppa";
    }
    return users
        .doc(loginController.text)
        .set({
          "friends": [],
          "lastvisited": "",
          "lastmark": "",
          "name": nameController.text
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
