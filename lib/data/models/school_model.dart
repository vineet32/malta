import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:malta/data/models/school.dart';

class SchoolModel extends ChangeNotifier {
  final List<School> schools = [
    School(name: 'Deonar school', imageUrl: 'imageUrl'),
    School(name: 'BTM school', imageUrl: 'imageUrl')];

  UnmodifiableListView<School> get getAllSchools => UnmodifiableListView(schools);

//Implement methods to receive data from DB

}