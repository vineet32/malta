import 'package:malta/data/models/class.dart';
import 'package:malta/data/models/section.dart';
import 'package:malta/data/models/subject.dart';
import 'package:malta/data/repositories/class/class_contract.dart';
import 'package:malta/data/repositories/section/section_contract.dart';
import 'package:malta/data/repositories/subject/subject_contract.dart';
import 'package:mockito/mockito.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class RepositoryMockClass extends Mock implements ClassContract {}

class RepositoryMockSubject extends Mock implements SubjectContract {}

class RepositoryMockSection extends Mock implements SectionContract {}

Class getDummyClass(
    {String subjectName: "English", String sectionName: "Class-1A"}) {
  Subject subject = getDummySubject(subjectName: subjectName);
  Section section = getDummySection(sectionName: sectionName);

  List sections = [];
  for (int i = 0; i < 6; i++) {
    sections.add(section);
  }
  return Class()
    ..set('objectId', '1234abcd')
    ..set(keyVarUpdatedAt, DateTime.now())
    ..active = true
    ..school = ParseObject("School")
    ..sections = sections
    ..subject = subject
    ..teacher = ParseObject("User");
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
    ..school = ParseObject("School")
    ..image =
        "https://image.shutterstock.com/image-vector/vector-illustration-education-elements-260nw-1242560170.jpg";
  return subject;
}

Section getDummySection({String sectionName: "Class-1A"}) {
  Section section = Section();
  section
    ..set("objectId", "G1eMjzxDIv")
    ..set(keyVarUpdatedAt, DateTime.now())
    ..name = sectionName
    ..school = ParseObject("School")
    ..image =
        "https://image.shutterstock.com/image-vector/vector-illustration-education-elements-260nw-1242560170.jpg";
  return section;
}