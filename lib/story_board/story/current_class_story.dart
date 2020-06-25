import 'package:flutter/cupertino.dart';
import 'package:malta/data/repositories/class/api_class.dart';
import 'package:malta/data/repositories/subject/api_subject.dart';
import 'package:malta/pages/current_class.dart';
import 'package:storyboard/storyboard.dart';

class CurrentClassStory extends Story {
  @override
  bool get isFullScreen => true;

  @override
  List<Widget> get storyContent {
    return [
      CurrentClass(
        ApiClass(),
        ApiSubject(),
        "EXWWaUQGmd"
      ),
    ];
  }
}
