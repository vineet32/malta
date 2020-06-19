import 'package:flutter/cupertino.dart';
import 'package:malta/app/screens/current_sessions.dart';
import 'package:malta/models/session.dart';
import 'package:malta/models/subject.dart';
import 'package:storyboard/storyboard.dart';

class CurrentSessionsStory extends Story {
  @override
  List<Widget> get storyContent {
    return [
      CurrentSessions(
        session: [
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
        ],
        subjects: [
          Subject(name: "English"),
          Subject(name: "Hindi"),
          Subject(name: "Telugu"),
          Subject(name: "Maths"),
          Subject(name: "English"),
          Subject(name: "Hindi"),
        ],
      ),
    ];
  }
}
