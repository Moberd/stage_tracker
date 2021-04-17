import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stage_tracker/applications/employee_data.dart';

class Applications extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    generateDefault();
   return ApplicationsState(list);
  }

  List<EmployeeData> list = new List<EmployeeData>();
  void generateDefault()
  {
    list.add(new EmployeeData(Status.assepted, "Заголовок 1", "Описание 1", DateTime.now()));
    list.add(new EmployeeData(Status.denied, "Заголовок 2", "Описание 2", DateTime.now()));
    list.add(new EmployeeData(Status.waiting, "Заголовок 3", "Описание 3", DateTime.now()));
  }

}

class ApplicationsState extends State<Applications>
{
  List<EmployeeData> list;
  ApplicationsState(List<EmployeeData> l){list = l;}
  @override
  Widget build(BuildContext context) {
    return
        Padding(padding: EdgeInsets.only(
            left: 20, top: 20, right: 20, bottom: 20),
        child: EmployeerList(list)
        );
  }

}

class EmployeerList extends StatefulWidget{
  List<EmployeeData> _employees;
  EmployeerList(List<EmployeeData> list){_employees = list;}
  @override
  State<StatefulWidget> createState() {
    return EmployeerListState(_employees);
  }

}
class EmployeerListState extends State<EmployeerList>{
  List<EmployeeData> employeeData;
  EmployeerListState(List<EmployeeData> ed){employeeData = ed;}

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: employeeData.length,
    itemBuilder: (context,i) {
      return Card(
      child: Padding(
      padding: const EdgeInsets.all(5),
child: Row(
  children: [
    SizedBox(
        width:42.0,
      height:42.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: getColor(employeeData[i].status)
        ),
      ),
    ),
    Padding(padding: EdgeInsets.all(5.0),
    child: Column(
      children: [
        Row(
          children: [
            Text(employeeData[i].header,style: TextStyle(fontSize: 16),),
            Text(employeeData[i].timePassed.toString())
          ],
        ),
        Text(employeeData[i].description,style: TextStyle(fontSize: 14),)
      ],
    ),)
  ],
),
      ),
    );
    },);
  }

  Color getColor(Status s)
  {
    switch(s)
    {
      case Status.waiting:
        return Color(0xFFFFFFFF);
            break;
      case Status.denied:
        return Color(0xFFFC0000);
        break;
      case Status.assepted:
        return Color(0xFF00FF00);
        break;
    }
  }
}
