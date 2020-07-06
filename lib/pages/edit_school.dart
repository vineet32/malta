import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/repositories/school/school_contract.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:malta/widgets/school/add_school.dart';
import 'package:malta/widgets/school/edit_school_widget.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';

class EditSchool extends StatefulWidget {
  @override
  _EditSchoolState createState() => _EditSchoolState();
}

class _EditSchoolState extends State<EditSchool> {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(color: Colors.grey),
  );
  bool editMode = false;
  String schoolName;
  File pickedImage;
  bool _loading = false;
  Uint8List webImage;
  String webImageName;
  School school;
  @override
  Widget build(BuildContext context) {
    final schoolContract = Provider.of<SchoolProvider>(context);
    school = schoolContract.getCurrentlySelectedSchool;
    schoolName = school.name;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(school.name),
      // ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  setState(() {
                    editMode = !editMode;
                  });
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                return showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return AddSchool();
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  EditSchoolWidget(
                    onImagePickedBytes: (image, name) {
                      setState(() {
                        webImage = image;
                      });
                      webImageName = name;
                    },
                    webImage: webImage,
                    editMode: editMode,
                    onImagePicked: (image) {
                      setState(() {
                        pickedImage = image;
                      });
                    },
                    onSchoolNameChange: (name) {
                      schoolName = name;
                    },
                    schoolImage: pickedImage,
                    schoolImageUrl:
                        school.image == null ? null : school.image.url,
                    schoolName: schoolName,
                  ),
                  editMode
                      ? RaisedButton(
                          child: Text("update"),
                          onPressed: () async {
                            if (schoolName != null) {
                              await updateSchool();
                              print("update");
                              setState(() {
                                editMode = false;
                                _loading = false;
                              });
                            }
                          },
                        )
                      : Container()
                ],
              ),
            ),
    );
  }

  Future<ApiResponse> updateSchool() async {
    setState(() {
      _loading = true;
    });
    final _schoolApi = Provider.of<SchoolContract>(context, listen: false);

    ParseFile parseFile = pickedImage != null
        ? ParseFile(pickedImage)
        : webImage != null
            ? ParseFile(null, byteFile: webImage, name: webImageName)
            : null;
    if (parseFile != null) {
      school.set(School.keyImage, parseFile);
    }
    school.set(School.keyName, schoolName);
    return await _schoolApi.update(school);
  }
}
