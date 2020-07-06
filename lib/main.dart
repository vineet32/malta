import 'package:flutter/material.dart';
import 'package:malta/data/models/monitor.dart';
import 'package:malta/data/repositories/class/class_api.dart';
import 'package:malta/data/repositories/class/class_contract.dart';
import 'package:malta/data/repositories/connection/connection_api.dart';
import 'package:malta/data/repositories/connection/connection_contract.dart';
import 'package:malta/data/repositories/monitor/monitor_api.dart';
import 'package:malta/data/repositories/monitor/monitor_contract.dart';
import 'package:malta/data/repositories/section/section_api.dart';
import 'package:malta/data/repositories/section/section_contract.dart';
import 'package:malta/data/repositories/student/student_api.dart';
import 'package:malta/data/repositories/student/student_contract.dart';
import 'package:malta/data/repositories/subject/subject_api.dart';
import 'package:malta/data/repositories/subject/subject_contract.dart';
import 'package:malta/data/repositories/user/user_api.dart';
import 'package:malta/data/repositories/user/user_contract.dart';
import 'package:malta/pages/admin_tabs.dart';
import 'package:malta/pages/decision_page.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:malta/providers/user_provider.dart';
import 'package:malta/widgets/admin_tab/show_user_list.dart';
import 'package:provider/provider.dart';
import 'package:malta/data/repositories/school/school_api.dart';
import 'package:malta/data/repositories/school/school_contract.dart';

void main() async {
  runApp(MultiProvider(
    providers: [
      Provider<SchoolContract>(create: (_) => SchoolApi()),
      Provider<UserContract>(create: (_) => UserApi()),
      Provider<ClassContract>(create: (_) => ClassApi()),
      Provider<SectionContract>(create: (_) => SectionApi()),
      Provider<StudentContract>(create: (_) => StudentApi()),
      Provider<SubjectContract>(create: (_) => SubjectApi()),
      ChangeNotifierProvider<SchoolProvider>(create: (_) => SchoolProvider()),
      Provider<UserProvider>(create: (_) => UserProvider()),
      Provider<ConnectionContract>(create: (_) => ConnectionApi()),
      Provider<MonitorContract>(create: (_) => MonitorApi())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DecisionPage(),
    );
  }
}
