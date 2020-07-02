import 'dart:core';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/user.dart';
import 'package:malta/data/repositories/school/school_api.dart';
import 'package:malta/data/repositories/school/school_contract.dart';

class SchoolRepository implements SchoolContract {
  static SchoolRepository init({SchoolContract mockAPIProvider}) {
    final SchoolRepository repository = SchoolRepository();
    if (mockAPIProvider != null) {
      repository.api = mockAPIProvider;
    } else {
      repository.api = SchoolApi();
    }
    return repository;
  }

  SchoolContract api;

  @override
  Future<ApiResponse> add(School item) async {
      return await api.add(item);
    }

  @override
  Future<ApiResponse> addAll(List<School> items) async {
      return await api.addAll(items);
    }
  
    @override
    Future<ApiResponse> getAll() async {
      return await api.getAll();
    }
  
    @override
    Future<ApiResponse> getById(String id) async {
      return await api.getById(id);
    }

    @override
    Future<ApiResponse> getByUser(User item) async {
      return await api.getByUser(item);
    }
  
    @override
    Future<ApiResponse> remove(School item) async {
      return await api.remove(item);
    }
  
    @override
  Future<ApiResponse> update(School item) async {
      return await api.update(item);
    }
  
    @override
    Future<ApiResponse> updateAll(List<School> items) async {
      return await api.updateAll(items);
  }
  
  }