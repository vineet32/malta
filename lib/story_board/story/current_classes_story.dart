import 'package:flutter/cupertino.dart';
import 'package:malta/data/repositories/classes/classes_provider_api.dart';
import 'package:malta/data/repositories/subject/subject_provider_api.dart';
import 'package:malta/pages/current_classes.dart';
import 'package:storyboard/storyboard.dart';

class CurrentClassesStory extends Story {
  @override
  bool get isFullScreen => true;

  @override
  List<Widget> get storyContent {
    return [
      CurrentClasses(
        ClassesProviderApi(),
        SubjectProviderApi(),
      ),
    ];
  }
}
