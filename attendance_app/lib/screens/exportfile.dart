import 'package:attendanceapp/models/note.dart';
import 'package:attendanceapp/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class exportfile extends StatefulWidget {
  final GoogleSignInAccount _currentUser;
  final GoogleSignIn _googleSignIn;

  var selectedCollege;
  var selectedCourse;
  var selectedSemester;
  var selectedDepartment;
  var finalSubject;
  var selectedYear;

  exportfile(
      this._currentUser,
      this._googleSignIn,
      this.selectedCollege,
      this.selectedCourse,
      this.selectedSemester,
      this.selectedDepartment,
      this.finalSubject,
      this.selectedYear);

  @override
  State<StatefulWidget> createState() {
    return exportfileState(
        this._currentUser,
        this._googleSignIn,
        this.selectedCollege,
        this.selectedCourse,
        this.selectedSemester,
        this.selectedDepartment,
        this.finalSubject,
        this.selectedYear);
  }
}

class exportfileState extends State<exportfile> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  //Transfer data from one page to another
  var _currentUser;
  var _googleSignIn;

  var selectedCollege;
  var selectedCourse;
  var selectedSemester;
  var selectedDepartment;
  var finalSubject;
  var selectedYear;

  var filepath = "Retrieving file Location...";

  exportfileState(
      this._currentUser,
      this._googleSignIn,
      this.selectedCollege,
      this.selectedCourse,
      this.selectedSemester,
      this.selectedDepartment,
      this.finalSubject,
      this.selectedYear);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FutureBuilder(
        future: databasefilelocation(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            filepath = snapshot.data;
            debugPrint("DATA zzzz ${snapshot.data}");
          } else {
            filepath = "Retrieving file Location...";
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = List<Note>();
    }

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.green.shade100,

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
            backgroundColor: Colors.indigo,
            title: Text('Export to .CSV'),
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
        body: bodyforexport());
  }

  //bodyforAttendance
  Widget bodyforexport() {
    if (true) {
      return ListView(
        children: [
          // child 1
          Container(
              padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
              child: Container(
                  child: Text(
                "Instructions for exporting database to .CSV file.",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black),
              ))),

          // child 2
          Container(
            padding: EdgeInsets.fromLTRB(1, 0, 1, 1),
            child: Card(
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.filter_1,
                        color: Colors.indigoAccent,
                      ),
                      Text(
                        "\nDownload 'DB Browser for SQLite' and Install on your PC.",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                      imgDBbrowser(),
                      Row(
                        children: <Widget>[
                          Text(
                            "*Download Link: ",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                          Text(
                            "https://sqlitebrowser.org/dl/",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.blue),
                          ),
                        ],
                      ),
                      RaisedButton.icon(
                          elevation: 5,
                          color: Colors.indigoAccent,
                          onPressed: () {
                            downloadlink();
                          },
                          icon: Icon(
                            Icons.save_alt,
                            color: Colors.white,
                            size: 28,
                          ),
                          label: Text(
                            "Download for Windows/MacOS/Linux",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                )),
          ),
          //child 3
          Container(
            padding: EdgeInsets.fromLTRB(1, 0, 1, 1),
            child: Card(
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.filter_2,
                        color: Colors.indigoAccent,
                      ),
                      Text(
                        "\nIn your phone, COPY the database file (*Filename: attendanceapp.db ) from the location given below & PASTE the file in the root folder or Downloads folder of your phone's internal storage.\n",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "*File Location : ",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Center(
                        child: Text(
                          "$filepath ",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.amber.shade700),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "\n*File-Name : \n",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                          Text(
                            "\nattendanceapp.db\n",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.teal),
                          ),
                        ],
                      ),
                      Text(
                        "Now, Send the database-file to your PC.\n",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ],
                  ),
                )),
          ),

          //child 4
          Container(
            padding: EdgeInsets.fromLTRB(1, 0, 1, 1),
            child: Card(
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.filter_3,
                        color: Colors.indigoAccent,
                      ),
                      Text(
                        '\nOpen DB Browser for SQLite on your PC.\n\nNow, Click on the "Open Database" button present at the top-left corner.\n',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                      img1(),
                      Text(
                        '\nThen, select the "attendanceapp.db" file & click on "Open" button.\n',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                      img2(),
                      Container(
                        padding: EdgeInsets.all(5),
                      ),
                    ],
                  ),
                )),
          ),
          //child 5
          Container(
            padding: EdgeInsets.fromLTRB(1, 0, 1, 1),
            child: Card(
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.filter_4,
                        color: Colors.indigoAccent,
                      ),
                      Text(
                        '\nUnder "Database Structure" tab, Select one of the Table-Name which you want to export to .CSV.\n\nNext, "Right-Click" on the selected Table-Name, and then Click on "Export as CSV File" option from the dropdown.\n',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                      img3(),
                      Container(
                        padding: EdgeInsets.all(5),
                      ),
                    ],
                  ),
                )),
          ),
          //child 6
          Container(
            padding: EdgeInsets.fromLTRB(1, 0, 1, 1),
            child: Card(
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.filter_5,
                        color: Colors.indigoAccent,
                      ),
                      Text(
                        '\nAfter that, a new dialog box will appear on the screen.\n\nNow, Select ONE or More table-name(s) which you want to export as .CSV file.\n',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          '*NOTE : You can Select "Multiple" Table-names to export multiple tables at once by holding "CTRL-Key"\n',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.red),
                        ),
                      ),
                      img4(),
                      Text(
                        '\nThen, Click on "SAVE" button.\n',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ],
                  ),
                )),
          ),
          //child 7
          Container(
            padding: EdgeInsets.fromLTRB(1, 0, 1, 1),
            child: Card(
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.filter_6,
                        color: Colors.indigoAccent,
                      ),
                      Text(
                        '\n*NOTE : If you have selected "Multiple" tables to export as .CSV then, SKIP this Step & goto STEP-7.\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.red),
                      ),
                      Text(
                        'For "Single-File-Export", Browse the export Location and Type a filename (with .csv extension) for the new CSV file to be exported.\n',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                      Text(
                        'Finally, Click on "SAVE" button.\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.blue),
                      ),
                      img5(),
                      Text(
                        '\nSingle File Export Completed.\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.green.shade600),
                      ),
                      img7(),
                      Container(
                        padding: EdgeInsets.all(5),
                      ),
                    ],
                  ),
                )),
          ),
          //child 8
          Container(
            padding: EdgeInsets.fromLTRB(1, 0, 1, 5),
            child: Card(
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.filter_7,
                        color: Colors.indigoAccent,
                      ),
                      Text(
                        '\n*NOTE : This step is only for "Multiple" tables export as .CSV.\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.red),
                      ),
                      Text(
                        'For "Multiple-File-Export", Browse the export folder Location for all .CSV files.\n\nNo need to specify filename, it will be generated automatically.\n',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                      Text(
                        'Finally, Click on "Select Folder" button.\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.blue),
                      ),
                      img6(),
                      Text(
                        '\nMultiple File Export Completed.\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.green.shade600),
                      ),
                      img7(),
                      Container(
                        padding: EdgeInsets.all(5),
                      ),
                    ],
                  ),
                )),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.fiber_manual_record,
                  color: Colors.red,
                  size: 20,
                ),
                Icon(
                  Icons.fiber_manual_record,
                  color: Colors.blue,
                  size: 20,
                ),
                Icon(
                  Icons.fiber_manual_record,
                  color: Colors.green,
                  size: 20,
                ),
                Icon(
                  Icons.fiber_manual_record,
                  color: Colors.amber,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      );
    }
  }

  //path of file
  Future<String> databasefilelocation() async {
    // Get the directory path for both Android and iOS to store database.
    var di = await getExternalStorageDirectory();
    String path = join(di.path, 'attendanceapp.db');
    setState(() {
      filepath = path;
    });

    return path;
  }

//img 1
  Widget img1() {
    var assetImage = AssetImage("assets/icon/i1.png");
    var image = Image(
      image: assetImage,
    );
    return Container(
      child: image,
//      alignment: Alignment.center,
      margin: EdgeInsets.all(5),
    );
  }

  //img 2
  Widget img2() {
    var assetImage = AssetImage("assets/icon/i2.png");
    var image = Image(
      image: assetImage,
    );
    return Container(
      child: image,
//      alignment: Alignment.center,
      margin: EdgeInsets.all(5),
    );
  }

  //img 3
  Widget img3() {
    var assetImage = AssetImage("assets/icon/i3.png");
    var image = Image(
      image: assetImage,
    );
    return Container(
      child: image,
//      alignment: Alignment.center,
      margin: EdgeInsets.all(5),
    );
  }

  //img 4
  Widget img4() {
    var assetImage = AssetImage("assets/icon/i4.png");
    var image = Image(
      image: assetImage,
    );
    return Container(
      child: image,
//      alignment: Alignment.center,
      margin: EdgeInsets.all(5),
    );
  }

  //img 5
  Widget img5() {
    var assetImage = AssetImage("assets/icon/i5.png");
    var image = Image(
      image: assetImage,
    );
    return Container(
      child: image,
//      alignment: Alignment.center,
      margin: EdgeInsets.all(5),
    );
  }

  //img 6
  Widget img6() {
    var assetImage = AssetImage("assets/icon/i6.png");
    var image = Image(
      image: assetImage,
    );
    return Container(
      child: image,
//      alignment: Alignment.center,
      margin: EdgeInsets.all(5),
    );
  }

  //img 7
  Widget img7() {
    var assetImage = AssetImage("assets/icon/i7.png");
    var image = Image(
      image: assetImage,
    );
    return Container(
      child: image,
//      alignment: Alignment.center,
      margin: EdgeInsets.all(5),
    );
  }

//image csv icon
  Widget imgcsv() {
    var assetImage = AssetImage("assets/icon/csv.png");
    var image = Image(
      image: assetImage,
      width: 50,
      height: 50,
    );
    return Container(
      child: image,
//      alignment: Alignment.center,
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
    );
  }

//img db
  Widget imgDBbrowser() {
    var assetImage = AssetImage("assets/icon/db.png");
    var image = Image(
      image: assetImage,
      width: 35,
      height: 35,
    );
    return Container(
      child: image,
//      alignment: Alignment.center,
      margin: EdgeInsets.all(5),
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

  Future<void> downloadlink() async {
    const url = 'https://sqlitebrowser.org/dl/';
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
