class TaskEntity {
  final String id;
  final String title;
  final String? description;
  final bool isCompleted;

  TaskEntity({
    required this.id,
    required this.title,
    this.description,
    required this.isCompleted,
  });

  TaskEntity copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

}