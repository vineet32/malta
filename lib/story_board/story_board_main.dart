<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:malta/story_board/story/display_student_test.dart';

import 'package:storyboard/storyboard.dart';

void main() {
  runApp(
    MaterialApp(
      home: Storyboard(
          [
            StudentsSessionStory(),
          ],
      ),
=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storyboard/storyboard.dart';
import 'package:malta/story_board/story/display_school_test.dart';

void main() {
  runApp(MaterialApp(
      home: StoryboardApp([
        DisplaySchoolStory()
      ]),
>>>>>>> 99c4d874310c94bd7de2665df8b7dd355b0c107b
    ),
  );
}