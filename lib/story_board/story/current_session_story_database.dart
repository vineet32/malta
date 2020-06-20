import 'package:flutter/material.dart';
import 'package:malta/app/home/models/session.dart';
import 'package:malta/app/home/models/subject.dart';

class CurrentSessionStoryDataBase extends ChangeNotifier {
  //test data
  final List<Subject> _subjects = [
    Subject(name: "English"),
    Subject(name: "Hindi"),
    Subject(name: "Telugu"),
    Subject(name: "Maths"),
    Subject(name: "English"),
    Subject(name: "Hindi"),
    Subject(name: "English"),
    Subject(name: "Hindi"),
    Subject(name: "Telugu"),
    Subject(name: "Maths"),
    Subject(name: "English"),
    Subject(name: "Hindi"),
  ];
  final List<Session> _sesssions = [
    Session(
      subject: Subject(name: "Maths"),
      image:
          "https://lh3.googleusercontent.com/proxy/2tj1HTTkxfLUCHMYCMY7Ik_u9Dv-ctrQ7tteluo8MkL9bUzSFutbEcvkGroJxU6PTS84IHjfzCYjRsCflXcZ5k_CV2OAD2Al4i_fUCrb6cBVNvtB4TZhu97Z=w720-h405-rw",
    ),
    Session(
      subject: Subject(name: "English"),
      image:
          "https://lh3.googleusercontent.com/proxy/2tj1HTTkxfLUCHMYCMY7Ik_u9Dv-ctrQ7tteluo8MkL9bUzSFutbEcvkGroJxU6PTS84IHjfzCYjRsCflXcZ5k_CV2OAD2Al4i_fUCrb6cBVNvtB4TZhu97Z=w720-h405-rw",
    ),
    Session(
      subject: Subject(name: "Hindi"),
      image:
          "https://lh3.googleusercontent.com/proxy/2tj1HTTkxfLUCHMYCMY7Ik_u9Dv-ctrQ7tteluo8MkL9bUzSFutbEcvkGroJxU6PTS84IHjfzCYjRsCflXcZ5k_CV2OAD2Al4i_fUCrb6cBVNvtB4TZhu97Z=w720-h405-rw",
    ),
    Session(
      subject: Subject(name: "Maths"),
      image:
          "https://lh3.googleusercontent.com/proxy/2tj1HTTkxfLUCHMYCMY7Ik_u9Dv-ctrQ7tteluo8MkL9bUzSFutbEcvkGroJxU6PTS84IHjfzCYjRsCflXcZ5k_CV2OAD2Al4i_fUCrb6cBVNvtB4TZhu97Z=w720-h405-rw",
    ),
    Session(
      subject: Subject(name: "English"),
      image:
          "https://lh3.googleusercontent.com/proxy/2tj1HTTkxfLUCHMYCMY7Ik_u9Dv-ctrQ7tteluo8MkL9bUzSFutbEcvkGroJxU6PTS84IHjfzCYjRsCflXcZ5k_CV2OAD2Al4i_fUCrb6cBVNvtB4TZhu97Z=w720-h405-rw",
    ),
    Session(
      subject: Subject(name: "Hindi"),
      image:
          "https://lh3.googleusercontent.com/proxy/2tj1HTTkxfLUCHMYCMY7Ik_u9Dv-ctrQ7tteluo8MkL9bUzSFutbEcvkGroJxU6PTS84IHjfzCYjRsCflXcZ5k_CV2OAD2Al4i_fUCrb6cBVNvtB4TZhu97Z=w720-h405-rw",
    ),
  ];

  //test stream
  Stream<List<Session>> testSessionStream() async* {
    List<Session> tesSession = [];
    for (int i = 0; i < _sesssions.length; i++) {
      await Future.delayed(Duration(seconds: 2));
      tesSession.add(_sesssions[i]);
      print("strem list $tesSession");
      yield tesSession;
    }
  }

  Stream<List<Subject>> testSubjectStream() async* {
    List<Subject> tesSubjects = [];
    for (int i = 0; i < _sesssions.length; i++) {
      await Future.delayed(Duration(seconds: 1));
      tesSubjects.add(_subjects[i]);
      yield tesSubjects;
    }
  }
}
