import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/class.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/section.dart';
import 'package:malta/data/models/student.dart';
import 'package:malta/data/repositories/monitor/monitor_api.dart';
import 'package:malta/data/repositories/monitor/monitor_contract.dart';
import 'package:malta/data/repositories/student/student_contract.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:malta/widgets/student/student_details_card.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';

class StudentsInClass extends StatelessWidget {
  MonitorContract _monitorApi;
  Class currentClass;
  School school;
  StudentsInClass({this.currentClass});
  @override
  Widget build(BuildContext context) {
    _monitorApi=Provider.of<MonitorContract>(context);
    school=Provider.of<SchoolProvider>(context).getCurrentlySelectedSchool;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${currentClass['subject']['name']}',
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.left,
        ),
        backgroundColor: Colors.white,
        elevation: 5.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 30.0,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.orangeAccent,
            radius: 25,
            child: IconButton(
              icon: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              onPressed: () {
//                Navigator.push(context, MaterialPageRoute(builder: (context) => CameraScreen()));
                // do something
              },
            ),
          ),
        ],
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(currentClass['sections'].length, (index) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${currentClass['sections'][index]['name']}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0)),
                    Expanded(child: _showStudentList(currentClass['sections'][index]))
                  ],
                ),
              ),
            );
          })
        //    Expanded(child: _showStudentList()),

      ),
    );
  }

  Widget _showStudentList(Section section) {
    return FutureBuilder<ApiResponse>(
        future: _monitorApi.getAllStudents(section, school, currentClass),
        builder: (BuildContext context, AsyncSnapshot<ApiResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.results != null) {
              return GridView.builder(
                itemCount: snapshot.data.results.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (3)),
                itemBuilder: (BuildContext context, int index) {
                  final ParseObject student = snapshot.data.results[index]['student'];
                  final String name = student['name'];
                  final ParseFile image = student['image'];
                  return StudentDetailsCard(
                    name: name,
                    image: image,
                    section: section['name'],
                  );
                },
              );
            } else {
              return Center(child: Text('No Student Found..'));
            }
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                value: .5,
              ),
            );
          }
        });
  }
}
