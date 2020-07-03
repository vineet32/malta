import 'package:flutter/material.dart';
import 'package:malta/data/models/section.dart';
import 'package:malta/pages/students_in_section.dart';
import 'package:storyboard/storyboard.dart';

class StudentsInSectionStory extends Story {
  @override
  bool get isFullScreen => true;
  final Section section;
  StudentsInSectionStory({this.section});

  @override
  List<Widget> get storyContent {
    return [
      StudentsInSection(section: section,)
    ];
  }
}
