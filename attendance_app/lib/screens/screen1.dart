import 'dart:async';
import 'dart:convert';

import 'package:attendanceapp/models/note.dart';
import 'package:attendanceapp/screens/adddetailsform.dart';
import 'package:attendanceapp/screens/exportfile.dart';
import 'package:attendanceapp/screens/takeAttendance.dart';
import 'package:attendanceapp/utils/database_helper.dart';
import 'package:fancy_alert_dialog/fancy_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:url_launcher/url_launcher.dart';

import 'ViewAttendancePercentage.dart';
import 'listview.dart';

Future<Album> fetchAlbum() async {
  final response = await http.get('https://www.attendanceapp.ml/data.json');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final List<dynamic> id;
  final List<dynamic> studentId;
  final List<dynamic> name;
  final List<dynamic> classRoll;
  final List<dynamic> universityRoll;

  /* "id": 1
	    "StudentId": "1810901001",
            "name": " Kumar",
            "classRoll": 1,
	    "UniversityRoll": 10900118001,*/

  Album(
      {this.id,
      this.studentId,
      this.name,
      this.classRoll,
      this.universityRoll});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      studentId: json['studentId'],
      name: json['name'],
      classRoll: json['classRoll'],
      universityRoll: json['universityRoll'],
    );
  }
}

class screen1 extends StatefulWidget {
  final GoogleSignInAccount _currentUser;
  final GoogleSignIn _googleSignIn;

  var selectedCollege;
  var selectedCourse;
  var selectedSemester;
  var selectedDepartment;
  var finalSubject;
  var selectedYear;

  var data;

  var selectedSection;

  screen1(
      this._currentUser,
      this._googleSignIn,
      this.selectedCollege,
      this.selectedCourse,
      this.selectedSemester,
      this.selectedDepartment,
      this.finalSubject,
      this.selectedYear,
      this.data,
      this.selectedSection);

  @override
  State<StatefulWidget> createState() {
    return screen1State(
        this._currentUser,
        this._googleSignIn,
        this.selectedCollege,
        this.selectedCourse,
        this.selectedSemester,
        this.selectedDepartment,
        this.finalSubject,
        this.selectedYear,
        this.data,
        this.selectedSection);
  }
}

class screen1State extends State<screen1> {
  Future<Album> futureAlbum;

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;
  List data;

  DatabaseHelper dbhelper = DatabaseHelper();

  static Database _database; // Singleton Database

  String noteTable; //Table Name

  String colSNo = 'SNo';

  String colCollege = 'College';

  String colCourseDegree = 'CourseDegree';

  String colSemester = 'Semester';

  String colDepartment = 'Department';

  String colSection = 'Section';

  String colSubject = 'Subject';

  String colTeacher = 'Teacher';

  String colPassoutYear = 'PassoutYear';

  String colStudentID = 'StudentID';

  String colUniversityROLL = 'UniversityROLL';

  String colClassROLL = 'ClassROLL';

  String colName = 'Name';

  String colTotalAttendance = 'TotalAttendance';

  String colPresentDays = 'PresentDays';

  String colAttendancePercent = 'AttendancePercent';

  String colDay1 = 'Day1';
  String colDay2 = 'Day2';
  String colDay3 = 'Day3';
  String colDay4 = 'Day4';
  String colDay5 = 'Day5';
  String colDay6 = 'Day6';
  String colDay7 = 'Day7';
  String colDay8 = 'Day8';
  String colDay9 = 'Day9';
  String colDay10 = 'Day10';
  String colDay11 = 'Day11';
  String colDay12 = 'Day12';
  String colDay13 = 'Day13';
  String colDay14 = 'Day14';
  String colDay15 = 'Day15';
  String colDay16 = 'Day16';
  String colDay17 = 'Day17';
  String colDay18 = 'Day18';
  String colDay19 = 'Day19';
  String colDay20 = 'Day20';
  String colDay21 = 'Day21';
  String colDay22 = 'Day22';
  String colDay23 = 'Day23';
  String colDay24 = 'Day24';
  String colDay25 = 'Day25';
  String colDay26 = 'Day26';
  String colDay27 = 'Day27';
  String colDay28 = 'Day28';
  String colDay29 = 'Day29';
  String colDay30 = 'Day30';
  String colDay31 = 'Day31';
  String colDay32 = 'Day32';
  String colDay33 = 'Day33';
  String colDay34 = 'Day34';
  String colDay35 = 'Day35';
  String colDay36 = 'Day36';
  String colDay37 = 'Day37';
  String colDay38 = 'Day38';
  String colDay39 = 'Day39';
  String colDay40 = 'Day40';
  String colDay41 = 'Day41';
  String colDay42 = 'Day42';
  String colDay43 = 'Day43';
  String colDay44 = 'Day44';
  String colDay45 = 'Day45';
  String colDay46 = 'Day46';
  String colDay47 = 'Day47';
  String colDay48 = 'Day48';
  String colDay49 = 'Day49';
  String colDay50 = 'Day50';
  String colDay51 = 'Day51';
  String colDay52 = 'Day52';
  String colDay53 = 'Day53';
  String colDay54 = 'Day54';
  String colDay55 = 'Day55';
  String colDay56 = 'Day56';
  String colDay57 = 'Day57';
  String colDay58 = 'Day58';
  String colDay59 = 'Day59';
  String colDay60 = 'Day60';
  String colDay61 = 'Day61';
  String colDay62 = 'Day62';
  String colDay63 = 'Day63';
  String colDay64 = 'Day64';
  String colDay65 = 'Day65';
  String colDay66 = 'Day66';
  String colDay67 = 'Day67';
  String colDay68 = 'Day68';
  String colDay69 = 'Day69';
  String colDay70 = 'Day70';
  String colDay71 = 'Day71';
  String colDay72 = 'Day72';
  String colDay73 = 'Day73';
  String colDay74 = 'Day74';
  String colDay75 = 'Day75';
  String colDay76 = 'Day76';
  String colDay77 = 'Day77';
  String colDay78 = 'Day78';
  String colDay79 = 'Day79';
  String colDay80 = 'Day80';
  String colDay81 = 'Day81';
  String colDay82 = 'Day82';
  String colDay83 = 'Day83';
  String colDay84 = 'Day84';
  String colDay85 = 'Day85';
  String colDay86 = 'Day86';
  String colDay87 = 'Day87';
  String colDay88 = 'Day88';
  String colDay89 = 'Day89';
  String colDay90 = 'Day90';
  String colDay91 = 'Day91';
  String colDay92 = 'Day92';
  String colDay93 = 'Day93';
  String colDay94 = 'Day94';
  String colDay95 = 'Day95';
  String colDay96 = 'Day96';
  String colDay97 = 'Day97';
  String colDay98 = 'Day98';
  String colDay99 = 'Day99';
  String colDay100 = 'Day100';
  String colDay101 = 'Day101';
  String colDay102 = 'Day102';
  String colDay103 = 'Day103';
  String colDay104 = 'Day104';
  String colDay105 = 'Day105';
  String colDay106 = 'Day106';
  String colDay107 = 'Day107';
  String colDay108 = 'Day108';
  String colDay109 = 'Day109';
  String colDay110 = 'Day110';
  String colDay111 = 'Day111';
  String colDay112 = 'Day112';
  String colDay113 = 'Day113';
  String colDay114 = 'Day114';
  String colDay115 = 'Day115';
  String colDay116 = 'Day116';
  String colDay117 = 'Day117';
  String colDay118 = 'Day118';
  String colDay119 = 'Day119';
  String colDay120 = 'Day120';
  String colDay121 = 'Day121';
  String colDay122 = 'Day122';
  String colDay123 = 'Day123';
  String colDay124 = 'Day124';
  String colDay125 = 'Day125';
  String colDay126 = 'Day126';
  String colDay127 = 'Day127';
  String colDay128 = 'Day128';
  String colDay129 = 'Day129';
  String colDay130 = 'Day130';
  String colDay131 = 'Day131';
  String colDay132 = 'Day132';
  String colDay133 = 'Day133';
  String colDay134 = 'Day134';
  String colDay135 = 'Day135';
  String colDay136 = 'Day136';
  String colDay137 = 'Day137';
  String colDay138 = 'Day138';
  String colDay139 = 'Day139';
  String colDay140 = 'Day140';
  String colDay141 = 'Day141';
  String colDay142 = 'Day142';
  String colDay143 = 'Day143';
  String colDay144 = 'Day144';
  String colDay145 = 'Day145';
  String colDay146 = 'Day146';
  String colDay147 = 'Day147';
  String colDay148 = 'Day148';
  String colDay149 = 'Day149';
  String colDay150 = 'Day150';

  //Transfer data from one page to another
  var _currentUser;
  var _googleSignIn;

  var selectedCollege;
  var selectedCourse;
  var selectedSemester;
  var selectedDepartment;
  var finalSubject;
  var selectedYear;

  String appbartitle = "Attendance App";

  var selectedSection;

  screen1State(
      this._currentUser,
      this._googleSignIn,
      this.selectedCollege,
      this.selectedCourse,
      this.selectedSemester,
      this.selectedDepartment,
      this.finalSubject,
      this.selectedYear,
      this.data,
      this.selectedSection);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,

//floatingActionButton: FloatingActionButton(
//    onPressed: (){_scaffoldKey.currentState.openDrawer();},
//    child: Icon(Icons.apps),
//    ),

        drawer: Drawer(
          elevation: 20,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: _buildBodyforAppDrawer()),
              Container(
                padding: EdgeInsets.fromLTRB(10, 20, 5, 10),
                child: ListTile(
                  leading: Icon(
                    Icons.local_library,
                    size: 45,
                    color: Colors.indigo,
                  ),
                  title: Text(
                    "Attendance App",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  subtitle:
                      Text("Optimized for Educational Institutions & Colleges"),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.developer_mode,
                  color: Colors.pink,
                ),
                trailing: Icon(
                  Icons.android,
                  color: Colors.greenAccent.shade700,
                  size: 25,
                ),
                title: Text("Developer"),
                subtitle: Text(
                  "Saurav Kumar",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.help_outline,
                  color: Colors.pink,
                ),
                title: Text("Help/Support E-mail"),
                subtitle: Text("sauravkumar.cse2018@nsec.ac.in"),
              ),
              GestureDetector(
                onLongPress: () {
                  _launchURL();
                },
                onTap: () {
                  _launchURL();
                },
                child: ListTile(
                  leading: Icon(
                    Icons.link,
                    color: Colors.pink,
                  ),
                  title: Text("Website"),
                  subtitle: Text("https://attendanceapp.ml",
                      style: TextStyle(color: Colors.blue)),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.info_outline,
                  color: Colors.pink,
                ),
                title: Text("App Version"),
                subtitle: Text("Version 1.0.0"),
              ),
            ],
          ),
        ),
        appBar: AppBar(
            backgroundColor: Colors.indigo.shade500,
            title: Text('Attendance App'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: 30,
              onPressed: () {
//               _scaffoldKey.currentState.openDrawer();
                Navigator.pop(context, true);
              },
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 0),
                child: IconButton(
                  icon: Icon(Icons.apps),
                  tooltip: "Open AppDrawer",
                  iconSize: 27,
                  color: Colors.white,
                  onPressed: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: IconButton(
                  icon: Icon(Icons.info_outline),
                  tooltip: "About",
                  iconSize: 27,
                  color: Colors.white,
                  onPressed: () {
                    help();
                  },
                ),
              )
            ]),
        body: afterClickingNextBody());
  }

  //bodyforAttendance
  Widget afterClickingNextBody() {
    return ListView(
      children: [
        // child 0
        Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: GestureDetector(
              onTap: () {
                futureAlbum = fetchAlbum();

                syncdata();
              },
              child: Card(
                child: ListTile(
                  leading: Icon(
                    Icons.sync,
                    size: 30,
                    color: Colors.blue,
                  ),
                  title: Text("Sync Students Data from Server"),
                ),
              ),
            )),

        // child 1
        Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: GestureDetector(
              onTap: () {
                appbartitle = "Add New Student";
                Navigator.push(
                    this.context,
                    MaterialPageRoute(
                        builder: (context) => addsetailsform(
                            _currentUser,
                            _googleSignIn,
                            selectedCollege,
                            selectedCourse,
                            selectedSemester,
                            selectedDepartment,
                            finalSubject,
                            selectedYear,
                            appbartitle,
                            selectedSection,
                            data)));
              },
              child: Card(
                child: ListTile(
                  leading: Icon(
                    Icons.person_add,
                    size: 30,
                    color: Colors.indigoAccent,
                  ),
                  title: Text("Add New Student (Manually)"),
                ),
              ),
            )),

        // child 2
        Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: GestureDetector(
              onTap: () {
                appbartitle = "View Students";

                Navigator.push(
                    this.context,
                    MaterialPageRoute(
                        builder: (context) => listview(
                            _currentUser,
                            _googleSignIn,
                            selectedCollege,
                            selectedCourse,
                            selectedSemester,
                            selectedDepartment,
                            finalSubject,
                            selectedYear,
                            appbartitle,
                            data,
                            selectedSection)));
              },
              child: Card(
                child: ListTile(
                  leading: Icon(
                    Icons.receipt,
                    size: 30,
                    color: Colors.amber,
                  ),
                  title: Text("View & Edit Student Details"),
                ),
              ),
            )),

        //child 3
        Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
          child: GestureDetector(
            child: Card(
              child: ListTile(
                leading: Icon(
                  Icons.assessment,
                  size: 30,
                  color: Colors.purple,
                ),
                title: Text("Take Attendance"),
              ),
            ),
            onTap: () {
              appbartitle = "Take Attendance";

              Navigator.push(
                  this.context,
                  MaterialPageRoute(
                      builder: (context) => takeAttendance(
                          _currentUser,
                          _googleSignIn,
                          selectedCollege,
                          selectedCourse,
                          selectedSemester,
                          selectedDepartment,
                          finalSubject,
                          selectedYear,
                          appbartitle,
                          data,
                          selectedSection)));
            },
          ),
        ),

        //child 4
        Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
          child: GestureDetector(
            child: Card(
              child: ListTile(
                leading: Icon(
                  Icons.iso,
                  size: 30,
                  color: Colors.pinkAccent,
                ),
                title: Text("View Attendance Percentage"),
              ),
            ),
            onTap: () {
              appbartitle = "View Attendance %";

              Navigator.push(
                  this.context,
                  MaterialPageRoute(
                      builder: (context) => ViewAttendancePercentage(
                          _currentUser,
                          _googleSignIn,
                          selectedCollege,
                          selectedCourse,
                          selectedSemester,
                          selectedDepartment,
                          finalSubject,
                          selectedYear,
                          appbartitle,
                          data,
                          selectedSection)));
            },
          ),
        ),

        // child 5
        Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(
                      this.context,
                      MaterialPageRoute(
                          builder: (context) => exportfile(
                              this._currentUser,
                              this._googleSignIn,
                              this.selectedCollege,
                              this.selectedCourse,
                              this.selectedSemester,
                              this.selectedDepartment,
                              this.finalSubject,
                              this.selectedYear)));
                });
              },
              child: Card(
                child: ListTile(
                  leading: imgcsv(),
//                leading: Icon(Icons.import_export,size: 30,color: Colors.green,),
                  title: Text("Export Database to .CSV file"),
                ),
              ),
            )),

        // child 6
        Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: GestureDetector(
              onTap: () {
                fancyAlertDynamic();
              },
              child: Card(
                elevation: 1,
                child: ListTile(
                  leading: Icon(
                    Icons.delete_forever,
                    size: 30,
                    color: Colors.red,
                  ),
                  title: Text("Delete Current DataBase"),
                ),
              ),
            )),
      ],
    );
  }

  //About App
  void help() {
    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Icon(
          Icons.info,
          color: Colors.indigoAccent,
          size: 35,
        ),
        Text(
          " About ",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
        ),
      ]),
      content: ListView(
//mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Text("Attendance App",
                    style: TextStyle(color: Colors.black, fontSize: 20))),
            Center(
                child: Text("Application Version: 1.0.0\n",
                    style: TextStyle(color: Colors.black45, fontSize: 15))),
            Center(
                child: CircleAvatar(
              minRadius: 55,
              backgroundColor: Colors.yellow.shade100,
              child: imgAppIcon(),
            )),
            Center(
                child: Text(
              "\nCopyright © 2020 Saurav Kumar\n",
              style: TextStyle(color: Colors.redAccent, fontSize: 14),
            )),
            Center(
                child: Text(
                    "Thanks for using this app. For any help or feedback, contact the developer at : \n")),
            GestureDetector(
              onLongPress: null,
              onTap: null,
              child: Card(
                  child: Center(
                      child: Column(
                children: <Widget>[
                  Text(
                    "Email:",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "sauravkumar.cse2018@nsec.ac.in",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.lightBlue),
                  ),
                ],
              ))),
            ),
            GestureDetector(
              onLongPress: _launchURL,
              onTap: _launchURL,
              child: Card(
                  child: Center(
                      child: Column(
                children: <Widget>[
                  Text(
                    "Website:",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "https://attendanceapp.ml",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.lightBlue),
                  ),
                ],
              ))),
            ),
          ]),
      actionsOverflowDirection: VerticalDirection.up,
      actions: <Widget>[
        Container(
            padding: EdgeInsets.fromLTRB(0, 0, 5, 5),
            child: FlatButton(
              child: Text(
                "VIEW  LICENSES",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.pinkAccent),
              ),
              onPressed: () async {
                const url = 'https://attendanceapp.ml/licenses.html';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            )),
        Center(
          child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 5, 5),
              child: FlatButton(
                child: Text(
                  "CLOSE",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blueAccent),
                ),
                onPressed: () {
                  Navigator.of(this.context).pop();
                },
              )),
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: this.context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget imgAppIcon() {
    var assetImage = AssetImage("assets/icon/icon.png");
    var image = Image(
      image: assetImage,
      width: 75,
      height: 75,
    );
    return Container(
      child: image,
//      alignment: Alignment.center,
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
    );
  }

  //Internet Reminder
  void internet() {
    AlertDialog alertDialog = AlertDialog(
      elevation: 10,
      backgroundColor: Colors.white,
      title: Text("Network ERROR!"),
      content: Text("Unable to connect to the Internet."),
    );
    showDialog(context: this.context, builder: (_) => alertDialog);
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
      internet();
    }
  }

  Future<void> _handleSignOut() async {
    _googleSignIn.disconnect();
  }

  //img google icon
  Widget imgg() {
    var assetImage = AssetImage("assets/icon/g.png");
    var image = Image(
      image: assetImage,
      height: 25,
      width: 25,
    );
    return Container(
      child: image,
//      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
    );
  }

//App Drawer
  Widget _buildBodyforAppDrawer() {
    if (_currentUser != null) {
      return ListView(
//        mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
            color: Colors.amberAccent.shade100,
            child: Center(
              child: Text("You are currently signed in as",
                  style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic)),
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: ListTile(
                leading: GoogleUserCircleAvatar(
                  identity: _currentUser,
                ),
                title: Text(_currentUser.displayName ?? ''),
                subtitle: Text(_currentUser.email ?? ''),
              )),
          Container(
              padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
              child: RaisedButton.icon(
                icon: CircleAvatar(
                  child: imgg(),
                  backgroundColor: Colors.white70,
                ),
                color: Colors.pinkAccent,
                onPressed: () {
                  try {
                    _handleSignOut();
                    Navigator.pop(this.context);
                    Navigator.pop(this.context);
                  } catch (e) {}
                },
                label: Text(
                  'Sign Out',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )),
        ],
      );
    } else {
      return ListView(
//        mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisSize: MainAxisSize.max,

        children: <Widget>[
          Center(
            child: Text('You are not signed in...',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
          ),
          Center(
              child: Icon(
            Icons.person_pin,
            size: 85,
            color: Colors.deepPurple,
          )),
          Container(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: RaisedButton.icon(
                icon: CircleAvatar(
                  child: imgg(),
                  backgroundColor: Colors.white70,
                ),
                color: Colors.pinkAccent,
                onPressed: _handleSignIn,
                label: Text(
                  'Sign in with Google',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )),
        ],
      );
    }
  }

  _launchURL() async {
    const url = 'https://attendanceapp.ml';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //<DATABASE>
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    var directory = await getExternalStorageDirectory();

    String path = join(directory.path, 'attendanceapp.db');

    // Open/create the database at a given path
    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    _createDb(notesDatabase, 1);
    debugPrint(
        "\n\n\n\n\n\n\n\n\n\n\n\n\n\nDataBase created Successfully! ${directory.path}\n$path\n\n\n\n\n\n\n\n\n\n\n\n\n");

    return notesDatabase;
  }

  void _createDb(Database dbs, int newVersion) async {
    String dash = "_";
    noteTable =
        "NSEC_$selectedCourse$dash$selectedYear$dash$selectedDepartment$dash$selectedSection$dash$selectedSemester$dash$finalSubject";

    data = await dbs
        .rawQuery(' SELECT * FROM $noteTable ORDER BY $colClassROLL ASC ');

    if (data.isNotEmpty) debugPrint("\n\n${data.length}Data Found\n\n\n");
    for (int i = 0; i < 1; i++) debugPrint("${data[i]["SNo"]}\n");
  }

  Widget imgcsv() {
    var assetImage = AssetImage("assets/icon/csv.png");
    var image = Image(
      image: assetImage,
      width: 60,
      height: 60,
    );
    return Container(
      child: image,
//      alignment: Alignment.center,
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
    );
  }

  Widget img() {
    var assetImage = AssetImage("assets/icon/xlsicon.png");
    var image = Image(
      image: assetImage,
      width: 60,
      height: 60,
    );
    return Container(
      child: image,
//      alignment: Alignment.center,
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
    );
  }

  Widget imgxlsall() {
    var assetImage = AssetImage("assets/icon/xlsallicon.png");
    var image = Image(
      image: assetImage,
      width: 60,
      height: 60,
    );
    return Container(
      child: image,
//      alignment: Alignment.center,
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
    );
  }

  void successDialog() {
    AlertDialog alertDialog = AlertDialog(
        elevation: 10,
        backgroundColor: Colors.white,
        title: Icon(
          Icons.sync,
          size: 50,
          color: Colors.blue,
        ),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100,
              ),
            ),
            Container(child: Text("Success !")),
//
          ],
        ));
  }

  void syncdata() {
    AlertDialog alertDialog = AlertDialog(
      elevation: 10,
      backgroundColor: Colors.white,
      title: Icon(
        Icons.sync,
        size: 50,
        color: Colors.blue,
      ),
      content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<Album>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  insertintodatabaseaftersync(snapshot);

                  Future.delayed(const Duration(seconds: 25), () {
                    setState(() {
                      Navigator.pop(this.context);
                      Navigator.pop(this.context);
                      Navigator.push(
                          this.context,
                          MaterialPageRoute(
                              builder: (context) => screen1(
                                  _currentUser,
                                  _googleSignIn,
                                  selectedCollege,
                                  selectedCourse,
                                  selectedSemester,
                                  selectedDepartment,
                                  finalSubject,
                                  selectedYear,
                                  data,
                                  selectedSection)));
                      successDialog();
                    });
                  });

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                        child: SpinKitPouringHourglass(
                          color: Colors.blueAccent,
                          size: 130,
                        ),
                      ),
                      Container(
                          child: CircularProgressIndicator(
                        strokeWidth: 5,
                        backgroundColor: Colors.amber,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.red),
                      )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 50),
                          child: Text("Syncing Data...")),
                    ],
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  debugPrint("Network ERROR.");
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.error,
                          color: Colors.amber,
                          size: 100,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                        child: Text("Server Error !"),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: OutlineButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(" OK "),
                        ),
                      )
                    ],
                  );
                }

                // By default, show a loading spinner.
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(
                        strokeWidth: 5,
                        backgroundColor: Colors.amber,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 50),
                          child: Text("Initializing...")),
                    ]);
              },
            ),
          ]),
    );
    showDialog(context: this.context, builder: (_) => alertDialog);
  }

  Future<Database> opensavedb(AsyncSnapshot<Album> snapshot) async {
    // Get the directory path for both Android and iOS to store database.
    var directory = await getExternalStorageDirectory();

    String path = join(directory.path, 'attendanceapp.db');

    // Open/create the database at a given path
    var notesDatabase = await openDatabase(path, version: 1, onCreate: null);
    saving(notesDatabase, 1, snapshot);
    debugPrint(
        "\n\n\n\n\n\n\n\n\n\n\n\n\n\nDataBase created Successfully! ${directory.path}\n$path\n\n\n\n\n\n\n\n\n\n\n\n\n");

    return notesDatabase;
  }

  void saving(
      Database dbs, int newVersion, AsyncSnapshot<Album> snapshot) async {
    for (int z = 0; z < snapshot.data.studentId.length; z++) {
      String resultTeacher = _currentUser.displayName.replaceAll(' ', '_');
      String resultName = snapshot.data.name[z].replaceAll(' ', '_');
      String resultCollege = selectedCollege.replaceAll(' ', '_');
      String dash = "_";
      noteTable =
          "NSEC_$selectedCourse$dash$selectedYear$dash$selectedDepartment$dash$selectedSection$dash$selectedSemester$dash$finalSubject";

      int totaldays;
      if (data == null || data.isEmpty) {
        totaldays = 0;
      } else if (data != null && data.isNotEmpty) {
        List l1 = await dbs.rawQuery(
            'SELECT $colTotalAttendance FROM $noteTable WHERE $colSNo = "${data[0]["$colSNo"]}" ');
        totaldays = l1[0]["$colTotalAttendance"];
      }

      try {
        await dbs.execute(
            'INSERT INTO $noteTable ( $colCollege , $colCourseDegree , $colSemester , $colDepartment ,  $colSection  , $colSubject ,${colTeacher} , $colPassoutYear , $colStudentID , $colUniversityROLL , $colClassROLL , $colName , $colTotalAttendance ) VALUES( "$resultCollege" , "$selectedCourse", "$selectedSemester" , "$selectedDepartment" , "$selectedSection" , "$finalSubject" , "${resultTeacher}" ,"$selectedYear", "${snapshot.data.studentId[z]}" , ${snapshot.data.universityRoll[z]} , ${snapshot.data.classRoll[z]} , "${snapshot.data.name[z]}" , $totaldays )');

        debugPrint(
            "\n\nOnline Data inserted in table $noteTable . Successfully!\nTableNAME=$noteTable\n\n\n");

        updateDatabase();
      } catch (error) {
//        print(error);
      }
    }
  }

//insert online data in database
  void insertintodatabaseaftersync(AsyncSnapshot<Album> snapshot) {
    opensavedb(snapshot);
  }

  Future<Database> updateDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    var directory = await getExternalStorageDirectory();

    String path = join(directory.path, 'attendanceapp.db');

    // Open/create the database at a given path
    var notesDatabase = await openDatabase(path, version: 1, onCreate: _c);
    _c(notesDatabase, 1);
    debugPrint(
        "\n\n\n\n\n\n\n\n\n\n\n\n\n\nDataBase created Successfully! ${directory.path}\n$path\n\n\n\n\n\n\n\n\n\n\n\n\n");

    return notesDatabase;
  }

  void _c(Database dbs, int newVersion) async {
    String dash = "_";
    noteTable =
        "NSEC_$selectedCourse$dash$selectedYear$dash$selectedDepartment$dash$selectedSection$dash$selectedSemester$dash$finalSubject";

    data = await dbs
        .rawQuery(' SELECT * FROM $noteTable ORDER BY $colClassROLL ASC ');

    if (data.isNotEmpty) debugPrint("\n\n${data.length}Data Found\n\n\n");
  }

  void fancyAlertDynamic() {
    FancyAlertDialog.showFancyAlertDialog(
        this.context,
        'Confirm DELETE ?',
        "Are you sure you want to delete Current DataBase forever? It can't be undone.",
        Colors.redAccent.shade400,
        icon: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        labelPositiveButton: 'DELETE',
        onTapPositiveButton: () {
          Navigator.pop(this.context);
          deleteAll();
          //////////////////////////////////////////////////////////delete all///////////////////////////////////////////////

          debugPrint('tap positive button');
        },
        labelNegativeButton: 'Abort',
        onTapNegativeButton: () {
          Navigator.pop(this.context);
          debugPrint('tap negative button');
        });
  }

  Future<Database> deleteAll() async {
    // Get the directory path for both Android and iOS to store database.
    var directory = await getExternalStorageDirectory();

    String path = join(directory.path, 'attendanceapp.db');

    // Open/create the database at a given path
    var notesDatabase = await openDatabase(path, version: 1, onCreate: _delete);
    _delete(notesDatabase, 1);
    debugPrint(
        "\n\n\n\n\n\n\n\n\n\n\n\n\n\nDataBase created Successfully! ${directory.path}\n$path\n\n\n\n\n\n\n\n\n\n\n\n\n");

    return notesDatabase;
  }

  void _delete(Database dbs, int newVersion) async {
    String dash = "_";
    noteTable =
        "NSEC_$selectedCourse$dash$selectedYear$dash$selectedDepartment$dash$selectedSection$dash$selectedSemester$dash$finalSubject";

    try {
      await dbs.execute('DROP TABLE $noteTable');

      String t = "Delete DataBase Alert",
          c = "Current DataBase deleted successfully!";
      alertDialogDynamic(t, c);

      Future.delayed(const Duration(milliseconds: 1200), () {
        //navigate after delete

        Navigator.pop(this.context);
        Navigator.pop(this.context);
      });

      debugPrint("\n\nDataBase Deleted ALLLLL.\n\n\n");
    } catch (error) {
      print(error);
      String t = "Current DataBase Not Found",
          c = "Current DataBase already deleted.";
      alertDialogDynamic(t, c);
    }
  }

  void alertDialogDynamic(String t, String c) {
    AlertDialog alertDialog = AlertDialog(
      elevation: 10,
      backgroundColor: Colors.white,
      title: Text("$t"),
      content: Text("$c"),
    );
    showDialog(context: this.context, builder: (_) => alertDialog);
  }

  Widget imgDBbrowser() {
    var assetImage = AssetImage("assets/icon/db.png");
    var image = Image(
      image: assetImage,
      width: 60,
      height: 60,
    );
    return Container(
      child: image,
//      alignment: Alignment.center,
      margin: EdgeInsets.all(5),
    );
  }

  _launchDBbrowserdownloadpage() async {
    const url = 'https://sqlitebrowser.org/dl/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
