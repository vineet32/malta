import 'package:flutter/material.dart';
import 'package:malta/story_board/current_sessions_story.dart';
import 'package:storyboard/storyboard.dart';

void main() {
  runApp(
    MaterialApp(
      home: Storyboard(
        [
          CurrentSessionsStory(),
        ],
      ),
    ),
  );
}
