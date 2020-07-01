import 'dart:io';

import 'package:malta/data/models/class.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/section.dart';
import 'package:malta/data/models/student.dart';
import 'package:malta/data/models/subject.dart';
import 'package:malta/data/models/user.dart';
import 'package:malta/data/repositories/class/class_contract.dart';
import 'package:malta/data/repositories/section/section_contract.dart';
import 'package:malta/data/repositories/student/student_contract.dart';
import 'package:malta/data/repositories/subject/subject_contract.dart';
import 'package:mockito/mockito.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class RepositoryMockClass extends Mock implements ClassContract {}

class RepositoryMockSubject extends Mock implements SubjectContract {}

class RepositoryMockSection extends Mock implements SectionContract {}

class RepositoryMockStudent extends Mock implements StudentContract{}

Class getDummyClass(
    {String subjectName: "English", String sectionName: "Class-1A"}) {
  Subject subject = getDummySubject(subjectName: subjectName);
  Section section = getDummySection(sectionName: sectionName);
  User user = User("username", "password", "emailAddress@gmail.com")
    ..set(User.keyImage, ParseFile(File("")))
    ..image.url = "https://avatarfiles.alphacoders.com/152/152686.jpg";
  List sections = [];
  for (int i = 0; i < 6; i++) {
    sections.add(section);
  }
  return Class()
    ..set('objectId', '1234abcd')
    ..set(keyVarUpdatedAt, DateTime.now())
    ..active = true
    ..school = School()
    ..sections = sections
    ..subject = subject
    ..teacher = user;
}

Subject getDummySubject({String subjectName: "English"}) {
  Section section = getDummySection();

  List sections = [];
  for (int i = 0; i < 6; i++) {
    sections.add(section);
  }
  Subject subject = Subject()
    ..set('objectId', '1234abcd')
    ..set(keyVarUpdatedAt, DateTime.now())
    ..name = subjectName
    ..school = School()
    ..image = ParseFile(File(""))
    ..image.url =
        "https://image.shutterstock.com/image-vector/vector-illustration-education-elements-260nw-1242560170.jpg";
  return subject;
}

Section getDummySection({String sectionName: "Class-1A"}) {
  Section section = Section();
  section
    ..set("objectId", "G1eMjzxDIv")
    ..set(keyVarUpdatedAt, DateTime.now())
    ..name = sectionName
    ..school = School()
    ..image = ParseFile(File(""))
    ..image.url =
        "https://image.shutterstock.com/image-vector/vector-illustration-education-elements-260nw-1242560170.jpg";
  return section;
}
Student getDummyStudent() {
  Student student = Student()
    ..set('objectId', '1234student')
    ..set(keyVarUpdatedAt, DateTime.now())
    ..name = 'Rahul'
    ..gender='male'
    ..age=22
    ..image='https://i.pinimg.com/474x/57/53/74/575374bf227f9845685a2950dd976f88--cartoon-characters-remember-this.jpg'
    ..school=School()
    ..section=Section();
  return student;
}
