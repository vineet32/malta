import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/student.dart';
import 'package:malta/data/repositories/student/student_contract.dart';
import 'package:malta/widgets/student/student_details_card.dart';
import 'package:provider/provider.dart';

class StudentsInClass extends StatelessWidget {
  //final List<Student> student;
  var _studentApi;
  final String section;
  final String schoolId;

  StudentsInClass({this.section,this.schoolId});
  @override
  Widget build(BuildContext context) {
    _studentApi= Provider.of<StudentContract>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('$section',style: TextStyle(color: Colors.black),textAlign: TextAlign.left,),
        backgroundColor: Colors.white,
        elevation: 5.0,
        leading: Icon(
          Icons.arrow_back,
          size: 30.0,
          color: Colors.black,
        ),
        actions: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.orangeAccent,
            radius: 25,
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _showStudentList()),
        ],
      ),
    );
  }



  Widget _showStudentList() {
    return FutureBuilder<ApiResponse>(
        future: _studentApi.getParticularSectionsStudents(section, schoolId),
        builder: (BuildContext context, AsyncSnapshot<ApiResponse> snapshot) {
          if (snapshot.hasData) {
            if(snapshot.data.results!=null){
              return GridView.builder(
                itemCount:snapshot.data.results.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (3)),
                itemBuilder: (BuildContext context, int index) {
                  final Student student = snapshot.data.results[index];
                  //   final String id = student.objectId;
                  final String name = student.name;
                  //  final String gender = student.gender;
                  final String image=student.image;
                  //   final String section =student.section;
                  return StudentDetailsCard(name: name,imageLink: image,section: section,);
                },
              );
            }
            else{
              return Center(child: Text('No Data Found'));
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
