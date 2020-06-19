import 'package:flutter/material.dart';
import 'package:malta/screen/students_session.dart';
import 'file:///C:/Users/User/Documents/GitHub/malta/lib/models/student.dart';
import 'package:storyboard/storyboard.dart';

class StudentsSessionStory extends Story {
  bool get isFullScreen => true;
  @override
  List<Widget> get storyContent {
    return [
      StudentsSession(
        student: [
          Student(
              name: "Gita",
              image:
              "https://wallpapercave.com/wp/wp1812462.jpg",
              standard: "12"
          ),
          Student(
              name: "Sita",
              image:
              "https://i.pinimg.com/474x/e1/a8/52/e1a85263fdf725db380a56757031af58--shinchan-wallpapers-jom.jpg",
              standard: "12"
          ),
          Student(
              name: "Ram",
              image:
              "https://i.pinimg.com/474x/e1/a8/52/e1a85263fdf725db380a56757031af58--shinchan-wallpapers-jom.jpg",
              standard: '10'
          ),
          Student(
              name: "Ravan",
              image:
              "https://i.pinimg.com/474x/e1/a8/52/e1a85263fdf725db380a56757031af58--shinchan-wallpapers-jom.jpg",
              standard: '11'
          ),
          Student(
              name: "Krishna",
              image:
              "https://i.pinimg.com/474x/e1/a8/52/e1a85263fdf725db380a56757031af58--shinchan-wallpapers-jom.jpg",
              standard: '7'
          ),
          Student(
              name: "Shayam",
              image:
              "https://i.pinimg.com/474x/e1/a8/52/e1a85263fdf725db380a56757031af58--shinchan-wallpapers-jom.jpg",
              standard: '7'
          ),
          Student(
              name: "Rohan",
              image:
              "https://i.pinimg.com/474x/e1/a8/52/e1a85263fdf725db380a56757031af58--shinchan-wallpapers-jom.jpg",
              standard: '7'
          ),
          Student(
              name: "Laxhman",
              image:
              "https://i.pinimg.com/474x/e1/a8/52/e1a85263fdf725db380a56757031af58--shinchan-wallpapers-jom.jpg",
              standard: '7'
          ),
          Student(
              name: "Shiva",
              image:
              "https://i.pinimg.com/474x/e1/a8/52/e1a85263fdf725db380a56757031af58--shinchan-wallpapers-jom.jpg",
              standard: '7'
          ),
          Student(
              name: "Rudra",
              image:
              "https://i.pinimg.com/474x/e1/a8/52/e1a85263fdf725db380a56757031af58--shinchan-wallpapers-jom.jpg",
              standard: '7'
          ),
          Student(
              name: "Tom",
              image:
              "https://i.pinimg.com/474x/e1/a8/52/e1a85263fdf725db380a56757031af58--shinchan-wallpapers-jom.jpg",
              standard: '7'
          ),
          Student(
              name: "Jerry",
              image:
              "https://i.pinimg.com/474x/e1/a8/52/e1a85263fdf725db380a56757031af58--shinchan-wallpapers-jom.jpg",
              standard: '7'
          ),
        ],
      ),

    ];
  }
}
