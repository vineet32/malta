import 'package:flutter/material.dart';
import 'package:malta/pages/login.dart';
import 'package:storyboard/storyboard.dart';

class DisplayLoginStory extends Story{
  @override
  bool get isFullScreen => true;

  @override
  List<Widget> get storyContent {
    return [
      LogIn(),
    ];
  }
}