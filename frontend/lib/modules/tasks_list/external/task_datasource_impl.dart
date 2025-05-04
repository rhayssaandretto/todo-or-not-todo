import 'package:frontend/app_imports.dart';

class TaskDatasourceImpl implements ITaskDatasource {
  final IDioService service;

  TaskDatasourceImpl(this.service);


// TODO: colocar urls na env


  @override
  Future<void> addTask(Map<String, dynamic> task) async {
    try {
      await service.restRequest(
          url: 'http://localhost:3000/todos',
          method: DioMethodsEnum.post,
          body: task);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTask(String id) async {
    try {
      await service.restRequest(
        url: 'http://localhost:3000/todos/$id',
        method: DioMethodsEnum.delete,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<String> getAllTasks() async {
    try {
      final response = await service.restRequest(
          url: 'http://localhost:3000/todos', method: DioMethodsEnum.get);
      return response ?? '';
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<String> getTaskById(String id) async {
    try {
      final response = await service.restRequest(
        url: 'http://localhost:3000/todos/$id',
        method: DioMethodsEnum.get,
      );
      return response ?? '';
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> updateTask(Map<String, dynamic> task) async {
    try {
      await service.restRequest(
          url: 'http://localhost:3000/todos/${task['id']}',
          method: DioMethodsEnum.put,
          body: task);
    } catch (_) {
      rethrow;
    }
  }
}


