import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/connection.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/user.dart';
import 'package:malta/data/repositories/connection/connection_contract.dart';
import 'package:malta/data/repositories/school/school_contract.dart';
import 'package:malta/domain/constants/role_constants.dart';
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
  final _formKey = GlobalKey<FormState>();
  Uint8List bytes;

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ClipOval(
                      child: _schoolImage != null && !kIsWeb
                          ? GestureDetector(
                              child: Image.file(
                                _schoolImage,
                                width: 160,
                                height: 160,
                                colorBlendMode: BlendMode.colorBurn,
                                fit: BoxFit.fill,
                              ),
                              onTap: () async {
                                File _image = await getImage();
                                if (_image != null) {
                                  setState(() {
                                    _schoolImage = _image;
                                  });
                                }
                              },
                            )
                          : Container(
                              width: 100,
                              height: 100,
                              padding: EdgeInsets.all(5),
                              child: IconButton(
                                icon: Icon(
                                  Icons.camera_alt,
                                  size: 100,
                                ),
                                onPressed: kIsWeb
                                    ? null
                                    : () async {
                                        File _image = await getImage();
                                        if (_image != null) {
                                          setState(() {
                                            _schoolImage = _image;
                                          });
                                        }
                                      },
                              ),
                            ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.yellow,
                      ),
                      padding: EdgeInsets.all(5),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          onChanged: (String value) {
                            print('Value for field  saved as "$value"');
                            _schoolName = value;
                          },
                          validator: (val) =>
                              val.isEmpty ? 'Enter School Name' : null,
                          decoration: InputDecoration(
                            hintText: "School Name",
                            labelText: "School Name",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(5),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                  if (_formKey.currentState.validate()) {
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

  Future<File> getImage() async {
    final _picker = ImagePicker();
    PickedFile pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile?.path);
    }
    return null;
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

    ParseFile parseFile = _schoolImage != null ? ParseFile(_schoolImage) : null;
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
