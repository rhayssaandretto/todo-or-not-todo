import 'package:frontend/modules/tasks_list/domain/entities/task_entity.dart';

abstract class ITaskRepository {
  Future<List<TaskEntity>> getAllTasks();
  Future<TaskEntity> getTaskById(String id);
  Future<void> addTask(TaskEntity task);
  Future<void> updateTask(TaskEntity task);
  Future<void> deleteTask(String id);
}