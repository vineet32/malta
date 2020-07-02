import 'package:flutter/material.dart';
import 'package:malta/data/repositories/user/user_api.dart';
import 'package:malta/data/repositories/user/user_contract.dart';
import 'package:malta/pages/decision_page.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:malta/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:malta/data/repositories/school/school_api.dart';
import 'package:malta/data/repositories/school/school_contract.dart';


void main() async {
  runApp(MultiProvider(
      providers: [
        Provider<SchoolContract>(create: (_) => SchoolApi()),  
        Provider<UserContract>(create: (_) => UserApi()),
        ChangeNotifierProvider<SchoolProvider>(create: (_) => SchoolProvider()),
        Provider<UserProvider>(create: (_) => UserProvider()),
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