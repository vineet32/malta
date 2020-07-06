import 'package:flutter/material.dart';
import 'package:malta/pages/section_list.dart';
import 'package:storyboard/storyboard.dart';

class SectionListStory extends Story {
  @override
  bool get isFullScreen => true;

  @override
  List<Widget> get storyContent {
    return [
      SectionList()
    ];
  }
}
