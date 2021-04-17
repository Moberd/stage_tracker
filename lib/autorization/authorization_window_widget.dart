import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stage_tracker/autorization/registreation_window_widget.dart';

import '../home.dart';

class AuthorizationWindowWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AuthorizationWindowWidgetState(true);
  }
}

class AuthorizationWindowWidgetState extends State<AuthorizationWindowWidget> {
  bool _passwordVisible;
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  AuthorizationWindowWidgetState(bool passVis) {
    _passwordVisible = passVis;
  }

  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: Color(0xFFFFFFFF),
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: 60.0, top: 120.0, right: 60.0, bottom: 60.0),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 32.0,
                        color: Color(0xFF5DB075),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        left: 45.0, top: 60.0, right: 45.0, bottom: 20.0),
                    child: Column(
                        children: [
                          //Поле логина
                          TextFormField(
                            controller: loginController,
                            decoration: new InputDecoration(labelText: "Email"),
                            keyboardType: TextInputType.emailAddress,
                          ),

                          //Поле пароля
                          TextFormField(
                              controller: passwordController,
                              obscureText: _passwordVisible,

                              decoration: new InputDecoration(

                                  labelText: "Password",

                                  //кнопка показа пароля
                                  suffixIcon: TextButton(
                                    child: Text(
                                      _passwordVisible ? "Show" : "Hide",
                                      style: TextStyle(
                                          color: Color(0xFF5DB075)),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  )))
                        ])),

                //Нижний блок
                Padding(
                    padding: EdgeInsets.fromLTRB(10, 70, 10, 50),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            //Кнопка авторизации
                            MaterialButton(
                              onPressed: login,
                              color: Color(0xFF5DB075),
                              minWidth: 300.0,
                              height: 45.0,
                              child: Text(
                                "Log in",style: TextStyle(
                                fontSize: 16
                              ),
                              ),
                              textColor: Color(0xFFFFFFFF),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Color(0x5DB075)),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(100.0))
                              ),

                            ),
                            TextButton(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Forgot password",style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xFF5DB075)
                                ),
                                ),
                              ),
                              onPressed: onForgotPassword,
                            ),
                          ],
                        ))),
                Padding(padding: EdgeInsets.only(
                    left: 60.0, top: 120.0, right: 60.0, bottom: 60.0),
                child: TextButton(
                  child: Text("Sing up",
                    style: TextStyle(
                        color: Color(0xFF5DB075),
                      fontSize: 24.0
                    ),),
                  onPressed: () => onRegister(context),
                ),)
              ],
            ),
          )
        )
    );
  }

  void onForgotPassword() {
    auth.sendPasswordResetEmail(email: loginController.text);
  }

  static void onRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegistrationWindowWidget()),
    );
  }

  void login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: loginController.text, password: passwordController.text);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
