import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/class.dart';
import 'package:malta/data/models/section.dart';
import 'package:malta/data/models/subject.dart';
import 'package:malta/data/repositories/class/class_contract.dart';
import 'package:malta/data/repositories/section/section_contract.dart';
import 'package:malta/data/repositories/subject/subject_contract.dart';
import 'package:mockito/mockito.dart';

import 'repository_mock_utils.dart';

Future<ClassContract> getMockClassApi() async {
  final ClassContract repositoryApi = RepositoryMockClass();

  const String objectIdPrefix = '12345abc';
  final Class item1 = getDummyClass()..objectId = '${objectIdPrefix}0';
  final Class item2 = getDummyClass()..objectId = '${objectIdPrefix}1';
  final List<Class> mockList = List<Class>()..add(item1)..add(item2);

  when(repositoryApi.getById(any)).thenAnswer((_) async =>
      Future<ApiResponse>.value(
          ApiResponse(true, 200, <dynamic>[getDummyClass()], null)));
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
  final Subject item1 = getDummySubject()..objectId = '${objectIdPrefix}0';
  final Subject item2 = getDummySubject()..objectId = '${objectIdPrefix}1';
  final Subject item3 = getDummySubject()..objectId = '${objectIdPrefix}2';
  final Subject item4 = getDummySubject()..objectId = '${objectIdPrefix}3';
  final Subject item5 = getDummySubject()..objectId = '${objectIdPrefix}4';
  final List<Subject> mockList = List<Subject>()
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
  when(repositoryApi.getBySchoolId(any)).thenAnswer((_) async =>
      Future<ApiResponse>.value(ApiResponse(true, 200, mockList, null)));
  return repositoryApi;
}

Future<SectionContract> getMockSectionApi() async {
  final SectionContract repositoryApi = RepositoryMockSection();

  const String objectIdPrefix = '12345abc';
  final Section item1 = getDummySection()..objectId = '${objectIdPrefix}0';
  final Section item2 = getDummySection()..objectId = '${objectIdPrefix}1';
  final Section item3 = getDummySection()..objectId = '${objectIdPrefix}2';
  final Section item4 = getDummySection()..objectId = '${objectIdPrefix}3';
  final Section item5 = getDummySection()..objectId = '${objectIdPrefix}4';
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
  when(repositoryApi.getBySchoolId(any)).thenAnswer((_) async =>
      Future<ApiResponse>.value(ApiResponse(true, 200, mockList, null)));
  return repositoryApi;
}
