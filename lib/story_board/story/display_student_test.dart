import 'package:flutter/material.dart';
import 'package:malta/pages/student_in_class.dart';
import 'package:storyboard/storyboard.dart';

class StudentsSessionStory extends Story {
  bool get isFullScreen => true;
  @override
  List<Widget> get storyContent {
    return [
      StudentInClass(
      ),
    ];
  }
}
