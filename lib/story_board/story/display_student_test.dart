import 'package:flutter/material.dart';
import 'package:malta/data/models/class.dart';
import 'package:malta/pages/students_in_class.dart';
import 'package:storyboard/storyboard.dart';

class StudentsInClassStory extends Story {
  @override
  bool get isFullScreen => true;

  @override
  List<Widget> get storyContent {
    return [
      StudentsInClass(currentClass: Class(),)
    ];
  }
}