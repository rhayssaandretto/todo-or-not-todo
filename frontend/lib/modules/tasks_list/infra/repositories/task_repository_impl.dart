import 'dart:convert';

import 'package:frontend/modules/modules_imports.dart';
import 'package:frontend/modules/tasks_list/domain/repositories/task_repository.dart';
import 'package:frontend/modules/tasks_list/infra/datasources/task_datasource.dart';

class TaskRepositoryImpl implements ITaskRepository {
  final ITaskDatasource _datasource;

  TaskRepositoryImpl(this._datasource);

  @override
  Future<void> addTask(TaskEntity task) async {
    try {
      await _datasource.addTask(TaskMapper.toJson(task));
    } catch (e) {
      throw Exception('Error adding task: $e');
    }
  }

  @override
  Future<void> deleteTask(String id) async {
    try {
      await _datasource.deleteTask(id);
    } catch (e) {
      throw Exception('Error deleting task: $e');
    }
  }

  @override
  Future<List<TaskEntity>> getAllTasks() async {
    try {
      final response = await _datasource.getAllTasks();
      final List<dynamic> jsonList = jsonDecode(response) as List<dynamic>;
      return jsonList.map((json) => TaskMapper.fromJson(json)).toList(); 
    } catch (e) {
      throw Exception('Error fetching tasks: $e');
    }
  }

  @override
  Future<TaskEntity> getTaskById(String id) async {
    try {
      final response = await _datasource.getTaskById(id);
      final Map<String, dynamic> json = jsonDecode(response) as Map<String, dynamic>;
      return TaskMapper.fromJson(json);
    } catch (e) {
      throw Exception('Error fetching task by ID: $e');
    }
  }

  @override
  Future<void> updateTask(TaskEntity task) async {
    try {
      await _datasource.updateTask(TaskMapper.toJson(task));
    } catch (e) {
      throw Exception('Error updating task: $e');
    }
  }
}
