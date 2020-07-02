import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/user.dart';
import 'package:malta/data/repositories/class/class_contract.dart';
import 'package:malta/data/repositories/class/class_repository.dart';
import 'package:malta/data/repositories/school/school_api.dart';
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
import 'package:malta/domain/constants/application_constants.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:malta/story_board/mock_data/repository_mock_api.dart';
import 'package:malta/story_board/story/current_class_story.dart';
import 'package:malta/story_board/story/display_login_test.dart';
import 'package:malta/story_board/story/display_student_test.dart';
import 'package:malta/story_board/story/home_page_story.dart';
import 'package:malta/story_board/story/video_recorder_story.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';
import 'package:storyboard/storyboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Parse().initialize(
    keyParseApplicationId,
    keyParseServerUrl,
    clientKey: clientId,
    autoSendSessionId: true,
    debug: true,
    coreStore: await CoreStoreSharedPrefsImp.getInstance(),
  );
  ClassContract mockClassApi = await getMockClassApi();
  SubjectContract mockSubjectApi = await getMockSubjectApi();
  SectionContract mockSectionApi = await getMockSectionApi();
  SchoolContract mockSchoolApi = await getMockSchoolApi();
  StudentContract mockStudentApi = await getMockStudentApi();

  User user = User("bhanu", "bhanu", "bhanu@gmail.com")
    ..set("objectId", "6BQNHAL0JE");
  School school = School()..set("objectId", "gwpUOZr8tf");

  runApp(
    MultiProvider(
      providers: [
        Provider<ClassContract>(
            create: (_) => ClassRepository.init(mockAPIProvider: mockClassApi)),
        Provider<SubjectContract>(
            create: (_) =>
                SubjectRepository.init(mockAPIProvider: mockSubjectApi)),
        Provider<SchoolContract>(create: (_) => SchoolApi()),
        Provider<SectionContract>(
            create: (_) =>
                SectionRepository.init(mockAPIProvider: mockSectionApi)),
        Provider<UserContract>(create: (_) => UserApi()),
        ChangeNotifierProvider<SchoolProvider>(create: (_) => SchoolProvider()),
        Provider<StudentContract>(
            create: (_) =>
                StudentRepository.init(mockAPIProvider: mockStudentApi)),
        Provider<User>(create: (_) => user),
        Provider<School>(create: (_) => school),
        Provider<UserContract>(create: (_) => UserApi()),
      ],
      child: MaterialApp(
        home: StoryboardApp([
          //DisplaySchoolStory(),
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
