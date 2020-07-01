import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/student.dart';
import 'package:malta/data/models/user.dart';
import 'package:malta/data/repositories/class/class_contract.dart';
import 'package:malta/data/repositories/class/class_repository.dart';
import 'package:malta/data/repositories/school/school_contract.dart';
import 'package:malta/data/repositories/section/section_contract.dart';
import 'package:malta/data/repositories/section/section_repository.dart';
import 'package:malta/data/repositories/student/student_contract.dart';
import 'package:malta/data/repositories/student/student_repository.dart';
import 'package:malta/data/repositories/subject/subject_contract.dart';
import 'package:malta/data/repositories/subject/subject_repository.dart';
import 'package:malta/data/repositories/school/school_repository.dart';
import 'package:malta/data/repositories/user/user_api.dart';
import 'package:malta/data/repositories/user/user_contract.dart';
import 'package:malta/story_board/mock_data/repository_mock_api.dart';
import 'package:malta/story_board/story/current_class_story.dart';
import 'package:malta/story_board/story/display_login_test.dart';
import 'package:malta/story_board/story/display_student_test.dart';
import 'package:malta/story_board/story/home_page_story.dart';
import 'package:malta/story_board/story/video_recorder_story.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';
import 'package:storyboard/storyboard.dart';
import 'package:malta/story_board/story/display_school_test.dart';
import 'package:malta/story_board/story/section_list_story.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Parse().initialize(
    "PARSE_APP_ID",
    "PARSE_APP_URL",
    clientKey: "CLIENT_KEY",
    autoSendSessionId: true,
    debug: true,
    coreStore: await CoreStoreSharedPrefsImp.getInstance(),
  );
  ClassContract mockClassApi = await getMockClassApi();
  SubjectContract mockSubjectApi = await getMockSubjectApi();
  SectionContract mockSectionApi = await getMockSectionApi();
  SchoolContract mockSchoolApi = await getMockSchoolApi();
  StudentContract mockStudentApi = await getMockStudentApi();

  User user = User("username", "password", "emailAddress")
    ..set("objectId", "T4enuoHtxH");
  School school = School()..set("objectId", "EXWWaUQGmd");

  runApp(
    MultiProvider(
      providers: [
        Provider<ClassContract>(
            create: (_) => ClassRepository.init(mockAPIProvider: mockClassApi)),
        Provider<SubjectContract>(
            create: (_) =>
                SubjectRepository.init(mockAPIProvider: mockSubjectApi)),
        Provider<SectionContract>(
            create: (_) =>
                SectionRepository.init(mockAPIProvider: mockSectionApi)),
        Provider<SchoolContract>(
          create: (_) => SchoolRepository.init(mockAPIProvider: mockSchoolApi),
        ),
        Provider<StudentContract>(
            create: (_) =>
                StudentRepository.init(mockAPIProvider: mockStudentApi)),
        Provider<User>(create: (_) => user),
        Provider<School>(create: (_) => school),
        Provider<UserContract>(create: (_) => UserApi()),
      ],
      child: MaterialApp(
        home: StoryboardApp([
          DisplaySchoolStory(),
          CurrentClassStory(),
          HomePageStory(),
          VideoRecorderStory(),
          //SectionListStory(),
          DisplayLoginStory(),
          StudentsInClassStory(),
        ]),
      ),
    ),
  );
}