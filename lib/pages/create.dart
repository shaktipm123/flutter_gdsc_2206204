import 'package:flutter/material.dart';
import 'package:crud_fin/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// class Create extends StatefulWidget {
//   const Create({super.key});

//   @override
//   State<Create> createState() => _CreateState();
// }

// class _CreateState extends State<Create> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }



class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  String studentName = "Rohan", studentID = "abc", studyProgramId = "a";
  double studentGPA = 15;

  void getStudentName(String name) {
    setState(() {
      studentName = name;
    });
  }

  void getStudentID(String id) {
    setState(() {
      studentID = id;
    });
  }

  // void getStudyProgramID(String programID) {
  //   setState(() {
  //     studyProgramId = programID;
  //   });
  // }

  void getStudentGPA(String gpa) {
    setState(() {
      studentGPA = double.parse(gpa);
    });
  }

  void createData() async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyStudents").doc(studentName);
    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentID": studentID,
      // "studyProgramID": studyProgramId,
      "studentGPA": studentGPA,
    };
    await documentReference.set(students);
    print("$studentName created");
  }

  Future<void> readData() async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyStudents").doc(studentName);
    DocumentSnapshot snapshot = await documentReference.get();
    if (snapshot.exists) {
      print(snapshot.data());
    } else {
      print("Document does not exist");
    }
  }

  void updateData() async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyStudents").doc(studentName);
    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentID": studentID,
      // "studyProgramID": studyProgramId,
      "studentGPA": studentGPA,
    };
    await documentReference.update(students);
    print("$studentName updated");
  }

  void deleteData() async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyStudents").doc(studentName);
    await documentReference.delete();
    print("$studentName deleted");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Flutter College"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Your TextFormFields and buttons here...
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Name",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String name) {
                  getStudentName(name);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Student ID",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String id) {
                  getStudentID(id);
                },
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(bottom: 8.0),
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //         labelText: "Study Program ID",
            //         fillColor: Colors.white,
            //         focusedBorder: OutlineInputBorder(
            //             borderSide:
            //                 BorderSide(color: Colors.blue, width: 2.0))),
            //     onChanged: (String ProgramID) {
            //       getStudyProgramID(ProgramID);
            //     },
            //   ),
            // ),

            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Gpa",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String gpa) {
                  getStudentGPA(gpa);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  // color: Colors.blue,
                  // shape:RoundedRectangleBorder(
                  //   borderRadius:BorderRadius.circular(16)
                  // ),
                  // textcolor:Colors.white,
                  child: Text("Create"),
                  onPressed: () {
                    createData();
                  },
                ),
                // ElevatedButton(
                //   child: Text("Read"),
                //   onPressed: () {
                //     readData();
                //   },
                // ),
                ElevatedButton(
                  child: Text("Update"),
                  onPressed: () {
                    updateData();
                  },
                ),
                // ElevatedButton(
                //   child: Text("Delete"),
                //   onPressed: () {
                //     deleteData();
                //   },
                // ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
