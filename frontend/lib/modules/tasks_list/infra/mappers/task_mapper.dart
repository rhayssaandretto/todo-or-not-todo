import 'package:frontend/modules/modules_imports.dart';

class TaskMapper {
  static TaskEntity fromJson(Map<String, dynamic> json) {
    return TaskEntity(
      id: (json['id'] ?? json['_id']) as String,
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }

  static Map<String, dynamic> toJson(TaskEntity task) {
    return {
      'id': task.id,
      'title': task.title,
      'isCompleted': task.isCompleted,
    };
  }
}
