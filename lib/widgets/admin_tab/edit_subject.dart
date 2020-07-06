import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/subject.dart';
import 'package:malta/data/repositories/subject/subject_contract.dart';
import 'package:malta/widgets/admin_tab/edit_subject_widget.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';

class EditSubject extends StatefulWidget {
  final Subject subject;

  const EditSubject({Key key, this.subject}) : super(key: key);
  @override
  _EditSubjectState createState() => _EditSubjectState();
}

class _EditSubjectState extends State<EditSubject> {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(color: Colors.grey),
  );
  bool editMode = false;
  String subjectName;
  File pickedImage;
  Uint8List webImage;
  String webImageName;
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    subjectName = widget.subject.name;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subject.name),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            editMode = !editMode;
          });
        },
        child: Icon(Icons.edit),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditSubjectWidget(
                      editMode: editMode,
                      webImage: webImage,
                      onImagePickedBytes: (image, name) {
                        setState(() {
                          webImage = image;
                        });
                        webImageName = name;
                      },
                      onImagePicked: (image) {
                        setState(() {
                          pickedImage = image;
                        });
                      },
                      onSubjectNameChange: (name) {
                        subjectName = name;
                      },
                      subjectImage: pickedImage,
                      subjectImageUrl: widget.subject.image == null
                          ? null
                          : widget.subject.image.url,
                      subjectName: subjectName,
                    ),
                  ),
                  editMode
                      ? RaisedButton(
                          child: Text("update"),
                          onPressed: () async {
                            if (subjectName != null) {
                              await updateSubject();
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

  Future<ApiResponse> updateSubject() async {
    setState(() {
      _loading = true;
    });
    final _subjectApi = Provider.of<SubjectContract>(context, listen: false);

    ParseFile parseFile = pickedImage != null
        ? ParseFile(pickedImage)
        : webImage != null
            ? ParseFile(null, byteFile: webImage, name: webImageName)
            : null;
    if (parseFile != null) {
      widget.subject.set(Subject.keyImage, parseFile);
    }
    widget.subject.set(Subject.keyName, subjectName);
    return await _subjectApi.add(widget.subject);
  }
}
