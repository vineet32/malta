import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/app/home/models/student.dart';
import 'package:malta/app/home/widgets/student_details_card.dart';


class StudentsSession extends StatelessWidget {
 final List<Student> student;
 StudentsSession({this.student});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Class- 1A(MATH)',style: TextStyle(color: Colors.black),textAlign: TextAlign.left,),
          backgroundColor: Colors.white,
          elevation: 5.0,
          leading: Icon(Icons.arrow_back,size: 30.0,color: Colors.black,),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.camera,
                color: Colors.orangeAccent,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Students',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 5.0,
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                crossAxisCount: 2,
                children: student.map((e) {
                  return StudentDetailsCard(student: e,);
                }).toList(),
              ),
            ),
            Container(
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 5.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text(
                            "STOP CLASS",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}
