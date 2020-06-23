import 'package:flutter/cupertino.dart';
import 'package:malta/pages/current_sessions.dart';
import 'package:storyboard/storyboard.dart';

class CurrentClassesStory extends Story {
  @override
  bool get isFullScreen => true;

  @override
  List<Widget> get storyContent {
    return [
      CurrentClasses(),
    ];
  }
}
