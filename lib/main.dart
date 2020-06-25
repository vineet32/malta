import 'package:flutter/material.dart';
import 'package:malta/pages/decision_page.dart';
import 'package:provider/provider.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:malta/data/repositories/school/api_school.dart';
import 'package:malta/data/repositories/user/api_user.dart';

void main() async {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SchoolProvider(schoolContract: SchoolApi(), userContract: UserApi())),
      ],
      child: MyApp(),)
      );
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