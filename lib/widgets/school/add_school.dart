import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/connection.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/user.dart';
import 'package:malta/data/repositories/connection/connection_contract.dart';
import 'package:malta/data/repositories/school/school_contract.dart';
import 'package:malta/domain/constants/role_constants.dart';
import 'package:malta/widgets/school/edit_school_widget.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';

class AddSchool extends StatefulWidget {
  const AddSchool({
    Key key,
  }) : super(key: key);
  @override
  _AddSchoolState createState() => _AddSchoolState();
}

class _AddSchoolState extends State<AddSchool> {
  File _schoolImage;
  String _schoolName;
  bool _loading = false;
  // Map webImage;
  Uint8List webImage;
  String webImageName;

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : AlertDialog(
            title: Text('Add School'),
            contentPadding: EdgeInsets.all(20),
            content: SingleChildScrollView(
              child: Center(
                child: EditSchoolWidget(
                  onSchoolNameChange: (name) => _schoolName = name,
                  webImage: webImage,
                  onImagePickedBytes: (image, name) {
                    setState(() {
                      webImage = image;
                    });
                    webImageName = name;
                  },
                  onImagePicked: (image) {
                    setState(() {
                      _schoolImage = image;
                    });
                  },
                  editMode: true,
                  schoolImage: _schoolImage,
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
                  if (_schoolName != null && _schoolName.isNotEmpty) {
                    ApiResponse response = await addNewSchool();
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

  Future<ApiResponse> addNewSchool() async {
    setState(() {
      _loading = true;
    });
    final _schoolApi = Provider.of<SchoolContract>(context, listen: false);
    final _connectionApi =
        Provider.of<ConnectionContract>(context, listen: false);
    final User user =
        await ParseUser.currentUser(customUserObject: User.clone());

    ParseFile parseFile = _schoolImage != null
        ? ParseFile(_schoolImage)
        : kIsWeb && webImage != null
            ? ParseFile(null, name: webImageName)
            : null;
    School _school = School()
      ..set(School.keyImage, parseFile)
      ..set(School.keyName, _schoolName);
    ApiResponse response = await _schoolApi.update(_school);
    _school = response.result;
    Connection _connection = Connection()
      ..set(Connection.keyRole, keyPrincipal)
      ..set(Connection.keyUser, user)
      ..set(Connection.keySchool, School()..set("objectId", _school.objectId));

    return await _connectionApi.add(_connection);
  }
}
