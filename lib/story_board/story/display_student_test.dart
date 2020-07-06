import 'package:flutter/material.dart';
import 'package:malta/pages/students_in_class.dart';
import 'package:storyboard/storyboard.dart';

class StudentsInClassStory extends Story {
  @override
  bool get isFullScreen => true;

  @override
  List<Widget> get storyContent {
    return [
      StudentsInClass(sections: ['Class-1A','Class-1B'],subject: 'English',)
    ];
  }
}