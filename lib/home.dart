import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'applications/applications.dart';
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    Applications(),
    MyHomePage(title: 'Flutter Demo Home Page'),
    MyHomePage(title: 'Flutter Demo Home Page'),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          //appBar: AppBar(title: Text('page 1')), ///Закомментируйте эту строку, когда создадите нормальные окна приложения
          body: _children[_currentIndex],

          bottomNavigationBar: BottomNavigationBar(
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            items: [
              ///Календарь со статистикой
              BottomNavigationBarItem(
                  icon: new Icon(Icons.calendar_today), label: 'Calendar'),

              ///Главный экран с вводом информации
              BottomNavigationBarItem(
                  icon: new Icon(Icons.home), label: 'Home'),

              /// социальная часть
              BottomNavigationBarItem(
                  icon: new Icon(Icons.account_box), label: 'Share')
            ],
          ),
        ),
        onWillPop: () async {
          return false;
        });
  }

  void onTabTapped(int index) {
    setState(() {
      print(index);
      _currentIndex = index;
    });
  }
}

//////////////////////////////////
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
