import 'package:flutter/material.dart';
import 'package:malta/story_board/class_tab_story.dart';
import 'package:storyboard/storyboard.dart';

void main() {
  runApp(
    MaterialApp(
      home: Storyboard(
        [
          ClassTabStory(),
        ],
      ),
    ),
  );
}
