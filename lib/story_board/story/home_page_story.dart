import 'package:flutter/cupertino.dart';
import 'package:malta/pages/home_page.dart';
import 'package:storyboard/storyboard.dart';

class HomePageStory extends Story {
  @override
  bool get isFullScreen => true;

  @override
  List<Widget> get storyContent {
    // School school = School()..set("objectId", "EXWWaUQGmd");
    return [
      HomePage(),
    ];
  }
}
