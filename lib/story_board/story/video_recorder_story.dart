import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/pages/camera_screen.dart';
import 'package:storyboard/storyboard.dart';

class VideoRecorderStory extends Story {
  @override
  bool get isFullScreen => true;

  @override
  List<Widget> get storyContent {
    return [CameraScreen()];
  }
}
