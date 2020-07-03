import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditSubjectWidget extends StatelessWidget {
  final bool editMode;
  final File subjectImage;
  final String subjectImageUrl;
  final Function(File image) onImagePicked;
  final Function(String name) onSubjectNameChange;
  final String subjectName;
  EditSubjectWidget({
    Key key,
    this.editMode: false,
    this.subjectImage,
    this.subjectImageUrl,
    this.onImagePicked,
    this.subjectName: '',
    this.onSubjectNameChange,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.grey),
    );
    return Column(
      children: [
        Center(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipOval(
                child: subjectImage == null
                    ? subjectImageUrl == null
                        ? Container(
                            width: 200,
                            height: 200,
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.person,
                              size: 100,
                            ),
                          )
                        : Image.network(
                            subjectImageUrl,
                            width: 200,
                            height: 200,
                            colorBlendMode: BlendMode.colorBurn,
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                width: 200,
                                height: 200,
                                padding: EdgeInsets.all(5),
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes
                                      : null,
                                ),
                              );
                            },
                          )
                    : Image.file(
                        subjectImage,
                        width: 200,
                        height: 200,
                        colorBlendMode: BlendMode.colorBurn,
                        fit: BoxFit.cover,
                      ),
              ),
              editMode && !kIsWeb
                  ? IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () async {
                        File image = await getImage();
                        if (image != null) {
                          onImagePicked(image);
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
                  // key: _formKey,
                  child: TextFormField(
                    onChanged: (input) {
                      onSubjectNameChange(input);
                    },
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'School name can\'t be Empty';
                      }
                      return null;
                    },
                    controller: TextEditingController(text: subjectName),
                    readOnly: !editMode,
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
      ],
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
}
