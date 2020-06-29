import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/repositories/class/class_api.dart';
import 'package:malta/data/repositories/class/class_contract.dart';
import 'package:malta/data/repositories/student/student_api.dart';
import 'package:malta/data/repositories/student/student_contract.dart';
import 'package:malta/data/repositories/subject/subject_api.dart';
import 'package:malta/data/repositories/subject/subject_contract.dart';
import 'package:malta/story_board/story/current_class_story.dart';
import 'package:malta/story_board/story/display_student_test.dart';
import 'package:provider/provider.dart';
import 'package:storyboard/storyboard.dart';
import 'package:malta/story_board/story/display_school_test.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        Provider<ClassContract>(create: (_) => ClassApi()),
        Provider<SubjectContract>(create: (_) => SubjectApi()),
        Provider<StudentContract>(create: (_)=>StudentApi())
      ],
      child: MaterialApp(
        home: StoryboardApp([
          DisplaySchoolStory(),
          CurrentClassStory(),
          StudentsInClassStory(),
        ]),
      ),
    ),
  );
}