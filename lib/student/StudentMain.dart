import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stage_tracker/student/StudentApplications.dart';
import 'package:stage_tracker/student/StudentProfile.dart';
import 'package:stage_tracker/student/StudentStages.dart';

class StudentMain extends StatefulWidget {
  @override
  _StudentMainState createState() => _StudentMainState();
}

class _StudentMainState extends State<StudentMain> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    StudentProfile(),
    StudentStages(),
    StudentApplication(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: _children[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            items: [
              ///Календарь со статистикой
              BottomNavigationBarItem(
                  icon: new Icon(Icons.calendar_today), label: ''),

              ///Главный экран с вводом информации
              BottomNavigationBarItem(
                  icon: new Icon(Icons.home), label: ''),

              /// социальная часть
              BottomNavigationBarItem(
                  icon: new Icon(Icons.account_box), label: '')
            ],
          ),
        ),
        onWillPop: ()async{
          return false;
        });

  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
