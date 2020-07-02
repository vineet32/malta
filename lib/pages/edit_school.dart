import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/repositories/school/school_contract.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:malta/widgets/school/add_school.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';

class EditSchool extends StatefulWidget {
  @override
  _EditSchoolState createState() => _EditSchoolState();
}

class _EditSchoolState extends State<EditSchool> {
  final _formKey = GlobalKey<FormState>();
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(color: Colors.grey),
  );
  bool editingMode = false;
  String schoolName;
  File pickedImage;
  bool _loading = false;
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
                    editingMode = true;
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
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        ClipOval(
                          child: pickedImage == null
                              ? Image.network(
                                  school.image == null
                                      ? 'https://i.pinimg.com/736x/4f/ae/53/4fae535ca7e76a966f7b432717cff19c.jpg'
                                      : school.image.url,
                                  width: 200,
                                  height: 200,
                                  colorBlendMode: BlendMode.colorBurn,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Container(
                                      width: 200,
                                      height: 200,
                                      padding: EdgeInsets.all(5),
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes
                                            : null,
                                      ),
                                    );
                                  },
                                )
                              : Image.file(
                                  pickedImage,
                                  width: 200,
                                  height: 200,
                                  colorBlendMode: BlendMode.colorBurn,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        editingMode && !kIsWeb
                            ? IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () async {
                                  File image = await getImage();
                                  if (image != null) {
                                    setState(() {
                                      pickedImage = image;
                                    });
                                  }
                                },
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Name:",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                              onChanged: (input) {
                                schoolName = input;
                              },
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'School name can\'t be Empty';
                                }
                                return null;
                              },
                              controller:
                                  TextEditingController(text: school.name),
                              readOnly: !editingMode,
                              textAlign: TextAlign.start,
                              // maxLines: 3,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                // contentPadding: EdgeInsets.all(8)
                                enabledBorder: border,
                                errorBorder: border,
                                focusedErrorBorder: border,
                                focusedBorder: border,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  editingMode
                      ? RaisedButton(
                          child: Text("update"),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              await updateSchool();
                              print("update");
                              setState(() {
                                editingMode = false;
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

  Future<File> getImage() async {
    final _picker = ImagePicker();
    PickedFile pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<ApiResponse> updateSchool() async {
    setState(() {
      _loading = true;
    });
    final _schoolApi = Provider.of<SchoolContract>(context, listen: false);

    ParseFile parseFile = pickedImage != null ? ParseFile(pickedImage) : null;
    if (parseFile != null) {
      school.set(School.keyImage, parseFile);
    }
    school.set(School.keyName, schoolName);
    return await _schoolApi.update(school);
  }
}
