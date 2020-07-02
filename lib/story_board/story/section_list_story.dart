import 'package:flutter/material.dart';
import 'package:malta/pages/administer.dart';
import 'package:storyboard/storyboard.dart';

class SectionListStory extends Story {
  @override
  bool get isFullScreen => true;

  @override
  List<Widget> get storyContent {
    return [
      Administer()
    ];
  }
}
