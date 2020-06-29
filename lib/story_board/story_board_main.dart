import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/repositories/class/class_contract.dart';
import 'package:malta/data/repositories/class/class_repository.dart';
import 'package:malta/data/repositories/section/section_contract.dart';
import 'package:malta/data/repositories/section/section_repository.dart';
import 'package:malta/data/repositories/subject/subject_contract.dart';
import 'package:malta/data/repositories/subject/subject_repository.dart';
import 'package:malta/story_board/mock_data/repository_mock_api.dart';
import 'package:malta/story_board/story/current_class_story.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';
import 'package:storyboard/storyboard.dart';
import 'package:malta/story_board/story/display_school_test.dart';

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
      ],
      child: MaterialApp(
        home: StoryboardApp([
          DisplaySchoolStory(),
          CurrentClassStory(),
        ]),
      ),
    ),
  );
}
