import 'package:flutter/cupertino.dart';
import 'package:malta/pages/current_class.dart';
import 'package:storyboard/storyboard.dart';

class CurrentClassStory extends Story {
  @override
  bool get isFullScreen => true;

  @override
  List<Widget> get storyContent {
    // School school = School()..set("objectId", "EXWWaUQGmd");
    return [
      CurrentClass(),
    ];
  }
}
