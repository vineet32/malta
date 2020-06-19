import 'package:flutter/material.dart';
import 'package:malta/storyboard/students_session_story.dart';
import 'package:storyboard/storyboard.dart';

void main() {
  runApp(
    MaterialApp(
      home: Storyboard(
          [
            StudentsSessionStory(),
          ],
      ),
    ),
  );
}