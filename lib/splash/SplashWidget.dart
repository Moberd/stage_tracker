
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stage_tracker/home.dart';

class SplashWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new SplashWidgetState();
  }

}

class SplashWidgetState extends State<SplashWidget>
{
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    auth.authStateChanges().listen((User user) {
      if(user != null)
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        }
      else
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        }
    });
    return Center(child: CircularProgressIndicator(),);
  }

}
