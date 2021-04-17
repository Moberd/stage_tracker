import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentStages extends StatefulWidget {
  @override
  _StudentStagesState createState() => _StudentStagesState();
}

class _StudentStagesState extends State<StudentStages> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection("stages").get(),
      builder: (context,collection){
        if(collection==null)return Center(child: CircularProgressIndicator(),);
        if(collection.data==null)return Center(child: CircularProgressIndicator(),);
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget> [
              Padding(padding: EdgeInsets.only(top:20),
              child:  Text("Stages",style: TextStyle(fontSize: 40),),),
              StagesList(stages: collection.data.docs,),
            ],
          )
          ,
        );

      },
    );
  }
}
class StagesList extends StatelessWidget {
  final List<QueryDocumentSnapshot>stages;
  const StagesList({Key key, this.stages}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    for(QueryDocumentSnapshot doc in stages){
    }
    return Container();
  }
}
