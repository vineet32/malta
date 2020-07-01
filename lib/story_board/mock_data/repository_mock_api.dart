import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/class.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/section.dart';
import 'package:malta/data/models/student.dart';
import 'package:malta/data/models/subject.dart';
import 'package:malta/data/repositories/class/class_contract.dart';
import 'package:malta/data/repositories/school/school_contract.dart';
import 'package:malta/data/repositories/section/section_contract.dart';
import 'package:malta/data/repositories/student/student_contract.dart';
import 'package:malta/data/repositories/subject/subject_contract.dart';
import 'package:mockito/mockito.dart';
import 'repository_mock_utils.dart';

Future<ClassContract> getMockClassApi() async {
  final ClassContract repositoryApi = RepositoryMockClass();

  const String objectIdPrefix = '12345abc';
  final Class item1 =
      getDummyClass(subjectName: "English", sectionName: "Class-1A")
        ..objectId = '${objectIdPrefix}0';
  final Class item2 =
      getDummyClass(subjectName: "Hindi", sectionName: "Class-1B")
        ..objectId = '${objectIdPrefix}1';
  final Class item3 =
      getDummyClass(subjectName: "Maths", sectionName: "Class-2A")
        ..objectId = '${objectIdPrefix}2';
  final List<Class> mockList = List<Class>()
    ..add(item1)
    ..add(item2)
    ..add(item3)
    ..add(item1)
    ..add(item2)
    ..add(item3)
    ..add(item1);

  when(repositoryApi.getById(any)).thenAnswer((_) async =>
      Future<ApiResponse>.value(ApiResponse(true, 200, mockList, null)));
  when(repositoryApi.getActive(any)).thenAnswer((_) async =>
      Future<ApiResponse>.value(ApiResponse(true, 200, mockList, null)));
  when(repositoryApi.getAll()).thenAnswer((_) async =>
      Future<ApiResponse>.value(ApiResponse(true, 200, mockList, null)));
  when(repositoryApi.add(any)).thenAnswer((_) async =>
      Future<ApiResponse>.value(ApiResponse(true, 200, mockList, null)));
  return repositoryApi;
}

Future<SubjectContract> getMockSubjectApi() async {
  final SubjectContract repositoryApi = RepositoryMockSubject();

  const String objectIdPrefix = '12345abc';
  final Subject item1 = getDummySubject(subjectName: "Hindi")
    ..objectId = '${objectIdPrefix}0';
  final Subject item2 = getDummySubject(subjectName: "English")
    ..objectId = '${objectIdPrefix}1';
  final Subject item3 = getDummySubject(subjectName: "Telugu")
    ..objectId = '${objectIdPrefix}2';
  final Subject item4 = getDummySubject(subjectName: "Maths")
    ..objectId = '${objectIdPrefix}3';
  final List<Subject> mockList = List<Subject>()
    ..add(item1)
    ..add(item2)
    ..add(item3)
    ..add(item4)
    ..add(item2)
    ..add(item3)
    ..add(item4);

  when(repositoryApi.getById(any)).thenAnswer((_) async =>
      Future<ApiResponse>.value(ApiResponse(true, 200, mockList, null)));
  when(repositoryApi.getAll()).thenAnswer((_) async =>
      Future<ApiResponse>.value(ApiResponse(true, 200, mockList, null)));
  when(repositoryApi.getBySchoolId(any)).thenAnswer((_) async =>
      Future<ApiResponse>.value(ApiResponse(true, 200, mockList, null)));
  return repositoryApi;
}

Future<SectionContract> getMockSectionApi() async {
  final SectionContract repositoryApi = RepositoryMockSection();

  const String objectIdPrefix = '12345abc';
  final Section item1 = getDummySection(sectionName: "Class-1A")
    ..objectId = '${objectIdPrefix}0';
  final Section item2 = getDummySection(sectionName: "Class-1B")
    ..objectId = '${objectIdPrefix}1';
  final Section item3 = getDummySection(sectionName: "Class-2A")
    ..objectId = '${objectIdPrefix}2';
  final Section item4 = getDummySection(sectionName: "Class-2B")
    ..objectId = '${objectIdPrefix}3';
  final Section item5 = getDummySection(sectionName: "Class-3A")
    ..objectId = '${objectIdPrefix}4';
  final List<Section> mockList = List<Section>()
    ..add(item1)
    ..add(item2)
    ..add(item3)
    ..add(item4)
    ..add(item5);

  when(repositoryApi.getById(any)).thenAnswer((_) async =>
      Future<ApiResponse>.value(
          ApiResponse(true, 200, <dynamic>[getDummyClass()], null)));
  when(repositoryApi.getById(any)).thenAnswer((_) async =>
      Future<ApiResponse>.value(ApiResponse(true, 200, mockList, null)));
  when(repositoryApi.getAll()).thenAnswer((_) async =>
      Future<ApiResponse>.value(ApiResponse(true, 200, mockList, null)));
  when(repositoryApi.getBySchool(any)).thenAnswer((_) async =>
      Future<ApiResponse>.value(ApiResponse(true, 200, mockList, null)));
  return repositoryApi;
}

Future<SchoolContract> getMockSchoolApi() async {
  final SchoolContract repositoryApi = RepositoryMockSchool();

  const String objectIdPrefix = '#sch00';
  final School item1 = getDummySchool(schoolName: "Tilak Nagar school")
    ..objectId = '${objectIdPrefix}0';
  final School item2 = getDummySchool(schoolName: "CC school")
    ..objectId = '${objectIdPrefix}1';
  final School item3 = getDummySchool(schoolName: "Deonar school")
    ..objectId = '${objectIdPrefix}2';
  final School item4 = getDummySchool(schoolName: "BTM school")
    ..objectId = '${objectIdPrefix}3';
  final School item5 = getDummySchool(schoolName: "Govt. school")
    ..objectId = '${objectIdPrefix}4';
  final List<School> mockList = List<School>()
    
    ..add(item1)
    ..add(item2)
    ..add(item3)
    ..add(item4)
    ..add(item5);

  when(repositoryApi.getById(any)).thenAnswer((_) async =>
      Future<ApiResponse>.value(
          ApiResponse(true, 200, <dynamic>[getDummySchool()], null)));
  when(repositoryApi.getById(any)).thenAnswer((_) async =>
      Future<ApiResponse>.value(ApiResponse(true, 200, mockList, null)));
  when(repositoryApi.getAll()).thenAnswer((_) async =>
      Future<ApiResponse>.value(ApiResponse(true, 200, mockList, null)));
  return repositoryApi;
}


Future<StudentContract> getMockStudentApi() async {
  final StudentContract repositoryApi = RepositoryMockStudent();

  const String objectIdPrefix = '12345abc';
  final Student item0 = getDummyStudent() ..objectId = '${objectIdPrefix}0';
  final Student item1 = getDummyStudent() ..objectId = '${objectIdPrefix}1';
  final Student item2 = getDummyStudent() ..objectId = '${objectIdPrefix}2';
  final Student item3 = getDummyStudent() ..objectId = '${objectIdPrefix}3';
  final Student item4 = getDummyStudent() ..objectId = '${objectIdPrefix}4';
  final List<Student> mockList = List<Student>()
    ..add(item0)
    ..add(item1)
    ..add(item2)
    ..add(item3)
    ..add(item4);


  when(repositoryApi.getById(any)).thenAnswer((_) async =>
  Future<ApiResponse>.value(ApiResponse(true, 200, mockList, null)));
  when(repositoryApi.getAll()).thenAnswer((_) async =>
  Future<ApiResponse>.value(ApiResponse(true, 200, mockList, null)));
  when(repositoryApi.getParticularSectionsStudents(any,any)).thenAnswer((_) async =>
  Future<ApiResponse>.value(ApiResponse(true, 200, mockList, null)));
  return repositoryApi;
  
}
