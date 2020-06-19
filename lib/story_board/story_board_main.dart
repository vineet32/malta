import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/story_board/story/current_sessions_story.dart';
import 'package:storyboard/storyboard.dart';
import 'package:malta/story_board/story/display_school_test.dart';

void main() {
  runApp(
    MaterialApp(
      home: StoryboardApp([
        DisplaySchoolStory(),
        CurrentSessionsStory(),
      ]),
    ),
  );
}
