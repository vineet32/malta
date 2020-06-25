import 'package:flutter/material.dart';
import 'package:malta/app/home/screens/display_school.dart';
import 'package:storyboard/storyboard.dart';

class DisplaySchoolStory extends Story {
  @override
  bool get isFullScreen => true;

  @override
  List<Widget> get storyContent {
    return [
      DisplaySchool()
    ];
  }
}