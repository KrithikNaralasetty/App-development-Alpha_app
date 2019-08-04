import 'package:flutter/material.dart';
import "./SelectScreen.dart";
import './SlideAnim.dart';
import './EmptyRooms.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Finder",
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  int index = 1;
  String db_val = "";
  String year, branch, section;
  final List<String> years = ["1st Year", "2nd Year", "3rd Year", "4th Year"];
  final List<String> branches = ["CSE", "ECE", "EEE", "MEC", "CIV", "IT"];
  final List<String> sections = ["A", "B", "C", "D", "E", "F"];

  Widget getContainer() {
    if (year != null && branch != null && section != null) {
      return Container(
        padding: EdgeInsets.all(40.0),
        child: Text(
          "You selected the class of $year $branch-$section",
          style: TextStyle(
            fontSize: 24.0,
            fontFamily: 'Mali',
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return SizedBox(
        height: 10.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(135, 131, 164, 212),
              Color.fromARGB(135, 131, 164, 212),
              Color.fromARGB(135, 131, 164, 212),
              Color.fromARGB(135, 131, 164, 212),
              Color.fromARGB(135, 182, 251, 255),
              Color.fromARGB(135, 182, 251, 255),
              Color.fromARGB(135, 182, 251, 255),
              Color.fromARGB(135, 182, 251, 255),
              Color.fromARGB(135, 182, 251, 255),
            ],
            stops: [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 200.0,
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(70.0, 0.0, 0.0, 0.0),
                  child: Text(
                    "Select Year",
                    style: TextStyle(
                      fontSize: 21.0,
                      fontFamily: 'Mali',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 60.0,
                ),
                DropdownButton<String>(
                  items: years.map(
                    (String item) {
                      return DropdownMenuItem(
                        child: Text(item),
                        value: item,
                      );
                    },
                  ).toList(),
                  onChanged: (String item) {
                    setState(() {
                      year = item;
                    });
                  },
                  value: year,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(70.0, 0.0, 0.0, 0.0),
                  child: Text(
                    "Select Branch",
                    style: TextStyle(
                      fontSize: 21.0,
                      fontFamily: 'Mali',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 60.0,
                ),
                DropdownButton<String>(
                  items: branches.map(
                    (String item) {
                      return DropdownMenuItem(
                        child: Text(item),
                        value: item,
                      );
                    },
                  ).toList(),
                  onChanged: (String item) {
                    setState(() {
                      branch = item;
                    });
                  },
                  value: branch,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(70.0, 0.0, 0.0, 0.0),
                  child: Text(
                    "Select Section",
                    style: TextStyle(
                      fontSize: 21.0,
                      fontFamily: 'Mali',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 60.0,
                ),
                DropdownButton<String>(
                  items: sections.map(
                    (String item) {
                      return DropdownMenuItem(
                        child: Text(item),
                        value: item,
                      );
                    },
                  ).toList(),
                  onChanged: (String item) {
                    setState(() {
                      section = item;
                    });
                  },
                  value: section,
                ),
              ],
            ),
            getContainer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          db_val = branch.toLowerCase() + section.toLowerCase() + year[0];
          Navigator.push(context, SlideRightRoute(page: SelectScreen(db_val)));
        },
        child: Icon(Icons.arrow_forward_ios),
        backgroundColor: Colors.cyan,
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.cyan,
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.room),
      //       title: Text("Empty Rooms"),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.assignment_ind),
      //       title: Text("Student"),
      //     )
      //   ],
      //   onTap: (int ind) {
      //     setState(() {
      //       index = ind;
      //     });
      //     if (index != 1) {
      //       Navigator.push(context, MaterialPageRoute(builder: (context) {
      //         return EmptyRooms();
      //       }));
      //     }
      //   },
      //   currentIndex: index,
      //   selectedItemColor: Colors.amber,
      // ),
    );
  }
}
