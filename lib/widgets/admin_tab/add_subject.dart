import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/subject.dart';
import 'package:malta/data/repositories/subject/subject_contract.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:malta/widgets/admin_tab/edit_subject_widget.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';

class AddSubject extends StatefulWidget {
  const AddSubject({
    Key key,
  }) : super(key: key);
  @override
  _AddSubjectState createState() => _AddSubjectState();
}

class _AddSubjectState extends State<AddSubject> {
  File _subjectImage;
  String _subjectName;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : AlertDialog(
            title: Text('Add subject'),
            contentPadding: EdgeInsets.all(20),
            content: SingleChildScrollView(
              child: Center(
                child: EditSubjectWidget(
                  onSubjectNameChange: (name) => _subjectName = name,
                  onImagePicked: (image) {
                    setState(() {
                      _subjectImage = image;
                    });
                  },
                  editMode: true,
                  subjectImage: _subjectImage,
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Cancel"),
              ),
              FlatButton(
                child: Text('Add'),
                onPressed: () async {
                  if (_subjectName != null && _subjectName.isNotEmpty) {
                    ApiResponse response = await addNewSubject();
                    setState(() {
                      _loading = false;
                    });
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          );
  }

  Future<ApiResponse> addNewSubject() async {
    setState(() {
      _loading = true;
    });
    final _subjectApi = Provider.of<SubjectContract>(context, listen: false);
    final _school = Provider.of<SchoolProvider>(context, listen: false);
    ParseFile parseFile =
        _subjectImage != null ? ParseFile(_subjectImage) : null;
    Subject _subject = Subject()
      ..set(Subject.keyImage, parseFile)
      ..set(
          Subject.keySchool,
          School()
            ..set("objectId", _school.getCurrentlySelectedSchool.objectId))
      ..set(Subject.keyName, _subjectName);

    return await _subjectApi.add(_subject);
  }
}
