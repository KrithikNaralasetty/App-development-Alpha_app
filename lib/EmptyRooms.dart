import './SlideAnim.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:core';

class EmptyRooms extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _EmptyRooms();
  }
}

class _EmptyRooms extends State<EmptyRooms>{
  var day = DateTime.now();
  var time = TimeOfDay.now();
  var time_now = TimeOfDay.now();
  var day_now = DateTime.now();

  final List<String> Days = [
    "monday",
    "tuesday",
    "wednesday",
    "thursday",
    "friday",
    "saturday",
    "sunday"
  ];

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      initialDate: day,
      firstDate: DateTime(2018),
      context: context,
      lastDate: DateTime(2021),
    );

    if (picked != null && picked != day) {
      setState(() {
        day = picked;
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: time,
    );

    if (picked != null && picked != time) {
      setState(() {
        time = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "Empty rooms",
          style: TextStyle(
            fontSize: 29.0,
            fontFamily: 'Mali',
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 80.0, bottom: 40.0),
              child: Text(
                "At what time do you want the room?",
                style: TextStyle(
                  fontSize: 29.0,
                  fontFamily: 'Mali',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
              child: RaisedButton(
                color: Colors.red[300],
                child: Text(
                  "Now",
                  style: TextStyle(
                    fontSize: 29.0,
                    fontFamily: 'Mali',
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                onPressed: () async {
                  String time_min = time_now.minute.toString();
                  String time_hour = time_now.hour.toString();
                  if (time_now.minute <= 9) {
                    time_min = "0" + time_now.minute.toString();
                  } else {
                    time_min = time_now.minute.toString();
                  }
                  if (time_now.hour <= 9) {
                    time_hour = "0" + time_now.minute.toString();
                  } else {
                    time_hour = time_now.minute.toString();
                  }
                  // var ou = await http.get(
                  //     "https://20190723t083945-dot-heyy-241909.appspot.com/giveroom?classCode=$val&weekday=$weekday&time=$time_hour:$time_min");
                  // String ouput = ou.body;
                  // Navigator.push(
                  //   context,
                  //   SlideRightRoute(
                  //       page: OuputScreen3(time_now, day_now, ouput)),
                  //);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "-------------------- OR --------------------",
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            SizedBox(height: 20.0,),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 36.0),
                  child: RaisedButton(
                    color: Colors.cyan,
                    child: Text(
                      "Select your Day",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Mali',
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                ),
                SizedBox(width: 10.0),
                Container(
                  child: RaisedButton(
                    color: Colors.cyan,
                    child: Text(
                      "Select your Time",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Mali',
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      _selectTime(context);
                    },
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 10.0),
                child: RaisedButton(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Mali',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  color: Colors.cyan,
                  onPressed: () async {
                    String time_hour = time.hour.toString();
                    String time_min = time.toString();
                    if (time.minute <= 9) {
                      time_min = "0" + time.minute.toString();
                    } else {
                      time_min = time.minute.toString();
                    }
                    if (time.hour <= 9) {
                      time_hour = "0" + time.hour.toString();
                    } else {
                      time_hour = time.hour.toString();
                    }
                    // var ou = await http.get(
                    //     "https://20190723t083945-dot-heyy-241909.appspot.com/giveroom?classCode=$val&weekday=$weekday&time=$time_hour:$time_min");
                    // String ouput = ou.body;
                    // Navigator.push(
                    //     context,
                    //     SlideRightRoute(
                    //         page: OuputScreen3(time, day, ouput)));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
