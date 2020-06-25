import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/repositories/class/api_class.dart';
import 'package:malta/data/repositories/subject/api_subject.dart';
import 'package:malta/story_board/story/current_class_story.dart';
import 'package:provider/provider.dart';
import 'package:storyboard/storyboard.dart';
import 'package:malta/story_board/story/display_school_test.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        Provider<ApiClass>(create: (_) => ApiClass()),
        Provider<ApiSubject>(create: (_) => ApiSubject()),
      ],
      child: MaterialApp(
        home: StoryboardApp([
          DisplaySchoolStory(),
          CurrentClassStory(),
        ]),
      ),
    ),
  );
}
