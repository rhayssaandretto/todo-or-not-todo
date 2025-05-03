import 'package:frontend/app_imports.dart';
import 'package:frontend/modules/tasks_list/infra/datasources/task_datasource.dart';

class TaskDatasourceImpl implements ITaskDatasource {
  final IDioService service;

  TaskDatasourceImpl(this.service);

  @override
  Future<void> addTask(Map<String, dynamic> task) async {
    try {
      await service.restRequest(
          url: '/todos', method: DioMethodsEnum.post, body: task);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTask(String id) async {
    try {
      await service.restRequest(
          url: '/todos', method: DioMethodsEnum.delete, query: {'id': id});
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<String> getAllTasks() async {
    try {
      final response =
          await service.restRequest(url: '/todos', method: DioMethodsEnum.get);
      return response ?? '';
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<String> getTaskById(String id) async {
    try {
      final response = await service.restRequest(
          url: '/todos', method: DioMethodsEnum.get, query: {'id': id});
      return response ?? '';
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> updateTask(Map<String, dynamic> task) async {
    try {
      await service.restRequest(
          url: '/todos', method: DioMethodsEnum.put, query: {'id': task['id']}, body: task);
    } catch (_) {
      rethrow;
    }
  }
}
