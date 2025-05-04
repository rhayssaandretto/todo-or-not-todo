class TaskEntity {
  final String id;
  final String title;
  final bool isCompleted;

  TaskEntity({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  TaskEntity copyWith({
    String? id,
    String? title,
    bool? isCompleted,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
