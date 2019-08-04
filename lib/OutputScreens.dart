import 'package:flutter/material.dart';
import './SlideAnim.dart';
import './main.dart';

Widget scaffold = Scaffold(
  appBar: AppBar(
    backgroundColor: Colors.cyan,
    title: Text("Beta"),
    centerTitle: true,
  ),
);

class OuputScreen1 extends StatefulWidget{
  final String val,ouput;
  OuputScreen1(this.val,this.ouput);
  @override
  State<StatefulWidget> createState() {
    return _OuputScreen1(val,ouput);
  }
}

class _OuputScreen1 extends State<OuputScreen1> {
  final String val;
  final List<String> Days = [
    "monday",
    "tuesday",
    "wednesday",
    "thursday",
    "friday",
    "saturday",
    "sunday"
  ];
  DateTime day = DateTime.now();
  String output;
  _OuputScreen1(this.val,this.output);
  @override
  Widget build(BuildContext context) {
    String year = val[4] + " Year";
    String branch = (val[0] + val[1] + val[2]).toUpperCase();
    String section = val[3].toUpperCase();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Lunch Details"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(children: <Widget>[
          Text(
          "The lunch period of $branch-$section of $year is $output",
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Mali',
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        ],),
        padding: EdgeInsets.all(100.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            SlideRightRoute(page: MyApp())
          );
        },
        child: Icon(Icons.arrow_forward_ios),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}


class OuputScreen2 extends StatefulWidget{
  final String val,ouput;
  final DateTime day;
  final TimeOfDay time;
  OuputScreen2(this.val,this.time,this.day,this.ouput);  
  @override
  State<StatefulWidget> createState() {
    return _OuputScreen2(val,time,day,ouput);
  }
}


class _OuputScreen2 extends State<OuputScreen2> {
  final String val,ouput;
  final DateTime day;
  final TimeOfDay time;
  final List<String> Days = [
    "monday",
    "tuesday",
    "wednesday",
    "thursday",
    "friday",
    "saturday",
    "sunday"
  ];

  _OuputScreen2(this.val, this.time, this.day,this.ouput);
  @override
  Widget build(BuildContext context) {
    String weekday = Days[day.weekday - 1];
    String ti = time.format(context);
    String year = val[4] + " Year";
    String branch = (val[0] + val[1] + val[2]).toUpperCase();
    String section = val[3].toUpperCase();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Class Details"),
        centerTitle: true,
      ),
      body: Container(
        child: Text(
          "The class room of $branch-$section of $year at $ti on $weekday would be $ouput",
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Mali',
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        padding: EdgeInsets.all(100.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            SlideRightRoute(page: MyApp())
          );
        },
        child: Icon(Icons.home),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}

class OuputScreen3 extends StatefulWidget{
  String ouput;
  var ti,day;
  OuputScreen3(this.ti,this.ouput);
  @override
  State<StatefulWidget> createState() {
    return _OuputScreen3(ti,day,ouput);
  }
}

class _OuputScreen3 extends State<OuputScreen3>{
  String ouput;
  var ti,day;
  _OuputScreen3(this.ti,this.day,this.ouput);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Class Details"),
        centerTitle: true,
      ),
      body: Container(
        child: Text(
          "The empty rooms at $ti on $day would be $ouput",
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Mali',
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        padding: EdgeInsets.all(100.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            SlideRightRoute(page: MyApp())
          );
        },
        child: Icon(Icons.home),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}