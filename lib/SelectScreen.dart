import 'package:http/http.dart' as http;
import 'dart:async';
import './TimeScreen.dart';
import 'package:flutter/material.dart';
import './OutputScreens.dart';
import './SlideAnim.dart';

class SelectScreen extends StatelessWidget {
  final String db_val;
  SelectScreen(this.db_val);
  final List<String> Days = [
    "monday",
    "tuesday",
    "wednesday",
    "thursday",
    "friday",
    "saturday",
    "sunday"
  ];
  var day = DateTime.now();
  @override
  Widget build(BuildContext context) {
    String weekday = Days[day.weekday -1];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Select Option"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 140.0),
              child: Text(
                "What would you like to know?",
                style: TextStyle(
                  fontSize: 29.0,
                  fontFamily: 'Mali',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 100.0, right: 100.0, top: 60.0),
              child: RaisedButton(
                color: Colors.red[200],
                child: Text(
                  "Lunch time",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Mali',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: ()async {
                  var ouput = await http.get("https://20190723t083945-dot-heyy-241909.appspot.com/lunchinfo?classCode=$db_val&weekday=$weekday");
                  String output= ouput.body;
                  Navigator.push(
                      context, SlideRightRoute(page: OuputScreen1(db_val,output)));
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 100.0, right: 100.0, top: 30.0),
              child: RaisedButton(
                color: Colors.cyan[200],
                child: Text(
                  "Room number of class",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Mali',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: ()async{
                  Navigator.push(
                      context, SlideRightRoute(page: TimeScreen(db_val)));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}