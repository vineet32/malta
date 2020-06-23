import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/student.dart';
import 'package:malta/data/repositories/student/student_provider_api.dart';
import 'package:malta/widgets/student_details_card.dart';



class StudentsSession extends StatefulWidget {
 //final List<Student> student;
 StudentsSession();

  @override
  _StudentsSessionState createState() => _StudentsSessionState();
}

class _StudentsSessionState extends State<StudentsSession> {
 final StudentProviderApi studentProviderApi =StudentProviderApi();

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
            Expanded(child: _showDietList()),
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

 Widget _showDietList() {
   return FutureBuilder<ApiResponse>(
       future: studentProviderApi.getAll(),
       builder: (BuildContext context, AsyncSnapshot<ApiResponse> snapshot) {
         if (snapshot.hasData) {
           if (snapshot.data.success) {
             if (snapshot.data.results == null ||
                 snapshot.data.results.isEmpty) {
               return Center(
                 child:Text("No Data"),
               );
             }
           }
           return GridView.builder(
             itemCount:snapshot.data.results.length,
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: (2)),
               itemBuilder: (BuildContext context, int index) {
                 final Student student = snapshot.data.results[index];
              //   final String id = student.objectId;
                 final String name = student.name;
               //  final String gender = student.gender;
                 final num age = student.age;
                 final String image=student.image;
              //   final String section =student.section;
                 return StudentDetailsCard(name: name,imageLink: image,age: age,);
               },
           );
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
