import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/pages/current_class.dart';
import 'package:storyboard/storyboard.dart';

class CurrentClassStory extends Story {
  @override
  bool get isFullScreen => true;

  @override
  List<Widget> get storyContent {
    // School school = School()..set("objectId", "EXWWaUQGmd");
    return [
      Scaffold(
          appBar: AppBar(
            title: Text("Current Sessions"),
          ),
          body: CurrentClass()),
    ];
  }
}
