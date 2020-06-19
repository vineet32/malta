
import 'package:flutter/material.dart';
import 'package:malta/story_board/story/display_student_test.dart';
import 'package:storyboard/storyboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:malta/story_board/story/display_school_test.dart';

void main() {
  runApp(MaterialApp(
      home: StoryboardApp([
        DisplaySchoolStory(),
        StudentsSessionStory(),
      ]),

    ),
  );
}