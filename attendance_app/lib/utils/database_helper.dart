import 'dart:core';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:attendanceapp/models/note.dart';
import 'package:path/path.dart';
import 'package:ext_storage/ext_storage.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; // Singleton DatabaseHelper
  static Database _database; // Singleton Database

  String noteTable; //Table Name

  String colSNo = 'SNo';

  String colCollege = 'College';

  String colCourseDegree = 'CourseDegree';

  String colSemester = 'Semester';

  String colDepartment = 'Department';

  String colSubject = 'Subject';

  String colTeacher = 'Teacher';

  String colPassoutYear = 'PassoutYear';

  String colStudentID = 'StudentID';

  String colUniversityROLL = 'UniversityROLL';

  String colClassROLL = 'ClassROLL';

  String colName = 'Name';

  String colTotalAttendance = 'TotalAttendance';

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

  var _currentUser;
  var _googleSignIn;
  var selectedCollege;
  var selectedCourse;
  var selectedSemester;
  var selectedDepartment;
  var finalSubject;
  var selectedYear;

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
     {
      _database = await initializeDatabase(  this._currentUser,
        this._googleSignIn,
        this.selectedCollege,
        this.selectedCourse,
        this.selectedSemester,
        this.selectedDepartment,
        this.finalSubject,
        this.selectedYear,);
    }
    return _database;
  }

  Future<Database> initializeDatabase( _currentUser,
      _googleSignIn,
      selectedCollege,
      selectedCourse,
      selectedSemester,
      selectedDepartment,
      finalSubject,
      selectedYear,) async {
    // Get the directory path for both Android and iOS to store database.
    var directory = await getExternalStorageDirectory();

    String path = join(directory.path, 'attendanceapp.db');
    debugPrint(
        "\n\n\n\n\n\n\n\n\n\n\n\n\n\nDataBase created Successfully! ${directory.path}\n$path\n\n\n\n\n\n\n\n\n\n\n\n\n");
    // Open/create the database at a given path
    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {

    noteTable =
        "$selectedCourse$selectedYear$selectedDepartment$selectedSemester${finalSubject}NSEC";
    debugPrint("\n\nTABLE created Successfully!\nTableNAME=$noteTable\n\n\n");
    await db.execute(
        'CREATE TABLE $noteTable($colSNo INTEGER PRIMARY KEY AUTOINCREMENT, $colCollege TEXT, '
        '$colCourseDegree TEXT, $colSemester TEXT, $colDepartment TEXT, $colSubject TEXT,$colTeacher TEXT, $colPassoutYear TEXT, $colStudentID TEXT, $colUniversityROLL INTEGER, $colClassROLL INTEGER, $colName TEXT, $colTotalAttendance INTEGER DEFAULT 0, $colDay1 TEXT, $colDay2 TEXT, $colDay3 TEXT, $colDay4 TEXT, $colDay5 TEXT, $colDay6 TEXT, $colDay7 TEXT, $colDay8 TEXT, $colDay9 TEXT, $colDay10 TEXT, $colDay11 TEXT, $colDay12 TEXT, $colDay13 TEXT, $colDay14 TEXT, $colDay15 TEXT, $colDay16 TEXT, $colDay17 TEXT, $colDay18 TEXT, $colDay19 TEXT, $colDay20 TEXT, $colDay21 TEXT, $colDay22 TEXT, $colDay23 TEXT, $colDay24 TEXT, $colDay25 TEXT, $colDay26 TEXT, $colDay27 TEXT, $colDay28 TEXT, $colDay29 TEXT, $colDay30 TEXT, $colDay31 TEXT, $colDay32 TEXT, $colDay33 TEXT, $colDay34 TEXT, $colDay35 TEXT, $colDay36 TEXT, $colDay37 TEXT, $colDay38 TEXT, $colDay39 TEXT, $colDay40 TEXT, $colDay41 TEXT, $colDay42 TEXT, $colDay43 TEXT, $colDay44 TEXT, $colDay45 TEXT, $colDay46 TEXT, $colDay47 TEXT, $colDay48 TEXT, $colDay49 TEXT, $colDay50 TEXT, $colDay51 TEXT, $colDay52 TEXT, $colDay53 TEXT, $colDay54 TEXT, $colDay55 TEXT, $colDay56 TEXT, $colDay57 TEXT, $colDay58 TEXT, $colDay59 TEXT, $colDay60 TEXT, $colDay61 TEXT, $colDay62 TEXT, $colDay63 TEXT, $colDay64 TEXT, $colDay65 TEXT, $colDay66 TEXT, $colDay67 TEXT, $colDay68 TEXT, $colDay69 TEXT, $colDay70 TEXT, $colDay71 TEXT, $colDay72 TEXT, $colDay73 TEXT, $colDay74 TEXT, $colDay75 TEXT, $colDay76 TEXT, $colDay77 TEXT, $colDay78 TEXT, $colDay79 TEXT, $colDay80 TEXT, $colDay81 TEXT, $colDay82 TEXT, $colDay83 TEXT, $colDay84 TEXT, $colDay85 TEXT, $colDay86 TEXT, $colDay87 TEXT, $colDay88 TEXT, $colDay89 TEXT, $colDay90 TEXT, $colDay91 TEXT, $colDay92 TEXT, $colDay93 TEXT, $colDay94 TEXT, $colDay95 TEXT, $colDay96 TEXT, $colDay97 TEXT, $colDay98 TEXT, $colDay99 TEXT, $colDay100 TEXT, $colDay101 TEXT, $colDay102 TEXT, $colDay103 TEXT, $colDay104 TEXT, $colDay105 TEXT, $colDay106 TEXT, $colDay107 TEXT, $colDay108 TEXT, $colDay109 TEXT, $colDay110 TEXT, $colDay111 TEXT, $colDay112 TEXT, $colDay113 TEXT, $colDay114 TEXT, $colDay115 TEXT, $colDay116 TEXT, $colDay117 TEXT, $colDay118 TEXT, $colDay119 TEXT, $colDay120 TEXT, $colDay121 TEXT, $colDay122 TEXT, $colDay123 TEXT, $colDay124 TEXT, $colDay125 TEXT, $colDay126 TEXT, $colDay127 TEXT, $colDay128 TEXT, $colDay129 TEXT, $colDay130 TEXT, $colDay131 TEXT, $colDay132 TEXT, $colDay133 TEXT, $colDay134 TEXT, $colDay135 TEXT, $colDay136 TEXT, $colDay137 TEXT, $colDay138 TEXT, $colDay139 TEXT, $colDay140 TEXT, $colDay141 TEXT, $colDay142 TEXT, $colDay143 TEXT, $colDay144 TEXT, $colDay145 TEXT, $colDay146 TEXT, $colDay147 TEXT, $colDay148 TEXT, $colDay149 TEXT, $colDay150 TEXT,)');

    debugPrint("\n\nTABLE created Successfully!\nTableNAME=$noteTable\n\n\n");
  }

  // Fetch Operation: Get all note objects from database
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(noteTable, orderBy: '$colClassROLL ASC');
    return result;
  }

  // Insert Operation: Insert a Note object to database
  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

  // Update Operation: Update a Note object and save it to database
  Future<int> updateNote(Note note) async {
    var db = await this.database;
    var result = await db.update(noteTable, note.toMap(),
        where: '$colSNo = ?', whereArgs: [note.SNo]);
    return result;
  }

  // Delete Operation: Delete a Note object from database
  Future<int> deleteNote(int SNo) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $noteTable WHERE $colSNo = $SNo ');
    return result;
  }

  // Get number of Note objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $noteTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<Note>> getNoteList() async {
    var noteMapList = await getNoteMapList(); // Get 'Map List' from database
    int count =
        noteMapList.length; // Count the number of map entries in db table

    List<Note> noteList = List<Note>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      noteList.add(Note.fromMapObject(noteMapList[i]));
    }

    return noteList;
  }


}
