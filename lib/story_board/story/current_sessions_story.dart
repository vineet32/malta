import 'package:flutter/cupertino.dart';
import 'package:malta/app/home/screens/current_sessions.dart';
import 'package:storyboard/storyboard.dart';

class CurrentSessionsStory extends Story {
  @override
  bool get isFullScreen => true;

  @override
  List<Widget> get storyContent {
    return [
      CurrentSessions(),
    ];
  }
}
