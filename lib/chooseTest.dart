import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stage_tracker/employer/EmployerMain.dart';
import 'package:stage_tracker/student/StudentMain.dart';
import 'package:stage_tracker/university/UniversityStart.dart';

class chooseWhichTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => StudentMain()));
            }, child: Text("TestStudent")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => UniversityMain()));
            }, child: Text("TestUniversity")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => EmployerMain()));
            }, child: Text("TestEmployer"))
          ],
        ),
      ),
    );
  }
}
