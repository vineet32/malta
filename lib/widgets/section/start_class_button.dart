import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/class.dart';
import 'package:malta/data/models/section.dart';
import 'package:malta/data/models/subject.dart';
import 'package:malta/data/models/user.dart';
import 'package:malta/data/repositories/class/class_contract.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';

class StartClassButton extends StatelessWidget {
  final List selectedSections;
  final Subject subject;

  StartClassButton({
    Key key,
    @required this.selectedSections,
    @required this.subject,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.yellow,
        ),
        child: FlatButton(
          onPressed: selectedSections.isEmpty
              ? null
              : () async => await startClass(context),
          child: Text(
            "START A CLASS",
          ),
        ),
      ),
    );
  }

  Future startClass(BuildContext context) async {
    if (selectedSections.isNotEmpty) {
      final _classApi = Provider.of<ClassContract>(context, listen: false);
      final school = Provider.of<SchoolProvider>(context, listen: false);
      Subject _subject = Subject()..objectId = subject.objectId;
      User teacher =
          await ParseUser.currentUser(customUserObject: User.clone());
      List _selectedSecitons = [];
      selectedSections.forEach((element) {
        Section section = Section()..objectId = element.objectId;
        _selectedSecitons.add(section);
      });
      ApiResponse response = await _classApi.add(
        Class()
          ..set(Class.keySections, _selectedSecitons)
          ..set(Class.keyActive, true)
          ..set(Class.keySubject, _subject)
          ..set(Class.keySchool, school.getCurrentlySelectedSchool)
          ..set(Class.keyTeacher, teacher),
      );
      print("Response ${response.results}");
    }
  }
}
