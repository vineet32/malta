import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/user.dart';
import 'package:malta/data/repositories/user/user_contract.dart';
import 'package:malta/providers/user_provider.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String username;

  String emailAddress;

  String name = 'name', address = 'email';

  static PickedFile image;
  final ImagePicker _picker = ImagePicker();
  Future<File> getImage() async {
    try{
      image = await _picker.getImage(source: ImageSource.gallery);
    }on Exception catch(e){
      print(e);
    }
    setState((){});
    if(image?.path != null){
      return File(image?.path);
    }
    return null;
  }
  static File userImage;
  ParseFile userImg;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    User user = userProvider.getCurrentUser;
    final userContract = Provider.of<UserContract>(context);
    
    return Scaffold(
      appBar: AppBar(
        title:Text('Profile'),
        actions: [
              RaisedButton(
                color: Colors.blue,
                onPressed: () async {
                  User user1 = User(username != null?username:user.username,
                       user.password, emailAddress != null?emailAddress:user.emailAddress)
                    ..objectId = user.objectId
                    ..set(User.keyImage, userImg != null?userImg:user.image);
                  await userContract.save(user1, sessionToken:user.sessionToken).then((value) {
                    (value.success)?print('Success'):print(value.error);
                  });
                    
                  Navigator.pop(context);
                },
                child: Text('Save'),
              )
          ],
        ),
          body: Column(
            children: [
            InkWell(
                child: CircleAvatar(
            backgroundImage: image == null?NetworkImage(
              user.image != null
                              ? user.image.url
                              : 'https://www.kindpng.com/picc/m/495-4952535_create-digital-profile-icon-blue-user-profile-icon.png'
            ):Image.file(File(image.path)),
            radius: 60,
          ),
          onTap: () async {
            if(!kIsWeb){
            userImage = await getImage();
            userImg = ParseFile(userImage);
            }
          }
        ),
            TextField(
                  onChanged: (value) {
                    username = value;
                  },
                  controller: TextEditingController()..text = user.username,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    emailAddress = value;
                  },
                  controller: TextEditingController()..text = user.emailAddress,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
          ],)
      );      
  }
}