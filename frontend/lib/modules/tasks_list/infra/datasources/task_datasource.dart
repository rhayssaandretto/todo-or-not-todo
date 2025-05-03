abstract class ITaskDatasource {
  Future<String> getAllTasks();
  Future<String> getTaskById(String id);
  Future<void> addTask(Map<String, dynamic> task);
  Future<void> updateTask(Map<String, dynamic> task);
  Future<void> deleteTask(String id);
}
