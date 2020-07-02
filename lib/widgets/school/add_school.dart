import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/user.dart';
import 'package:malta/data/repositories/school/school_contract.dart';
import 'package:malta/data/repositories/user/user_contract.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;

class AddSchool extends StatefulWidget {
  final User user;

  const AddSchool({
    Key key,
    @required this.user,
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
                      child: _schoolImage != null || bytes != null
                          ? GestureDetector(
                              child: kIsWeb
                                  ? Image.memory(bytes)
                                  : Image.file(
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
                                onPressed: () async {
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
                onPressed: _schoolImage == null
                    ? null
                    : () async {
                        if (_formKey.currentState.validate()) {
                          ApiResponse response = await updateSchool();
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
    if (kIsWeb) {
      await getImageFromBrowser();
      return null;
    }
    final _picker = ImagePicker();
    PickedFile pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile?.path);
    }
    return null;
  }

  Future getImageFromBrowser() async {
    List<html.File> files;
    final completer = new Completer<List<String>>();
    final html.InputElement input = html.document.createElement('input');
    input
      ..type = 'file'
      ..multiple = false
      ..accept = 'image/*';
    input.onChange.listen((e) async {
      files = input.files;

      Iterable<Future<String>> resultsFutures = files.map((file) {
        final reader = new html.FileReader();
        reader.readAsDataUrl(files[0]);
        reader.onError.listen((error) => completer.completeError(error));
        return reader.onLoad.first.then((_) => reader.result as String);
      });

      final results = await Future.wait(resultsFutures);
      completer.complete(results);
    });

    input.click();
    final List<String> images = await completer.future;

    int removeString = images[0].indexOf(',');
    var body = images[0];
    String imageType = files[0].type.substring(input.accept.length - 1);

    String encodedStr = body.substring(removeString + 1, body.length);
    Uint8List _imgDecoded = base64Decode(encodedStr);
    setState(() {
      bytes = _imgDecoded;
    });
    print("bytes $bytes");
  }

  Future<ApiResponse> updateSchool() async {
    setState(() {
      _loading = true;
    });
    final _schoolApi = Provider.of<SchoolContract>(context, listen: false);
    final _teacherApi = Provider.of<UserContract>(context, listen: false);

    ParseFile parseFile = ParseFile(_schoolImage);
    School _school = School()
      ..set("image", parseFile)
      ..set("name", _schoolName);
    ApiResponse response = await _schoolApi.update(_school);
    _school = response.result;
    List listSchoools = widget.user.schools == null ? [] : widget.user.schools;
    listSchoools.add(_school);
    widget.user..set(User.keySchools, listSchoools);
    ApiResponse res = await _teacherApi.save(widget.user);
    print("response $res ");
    return response;
  }
}
