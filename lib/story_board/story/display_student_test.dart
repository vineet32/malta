import 'package:flutter/material.dart';
import 'file:///C:/Users/User/Documents/GitHub/malta/lib/pages/students_session.dart';
import 'package:storyboard/storyboard.dart';

class StudentsSessionStory extends Story {
  bool get isFullScreen => true;
  @override
  List<Widget> get storyContent {
    return [
      StudentsSession(
      ),
    ];
  }
}
