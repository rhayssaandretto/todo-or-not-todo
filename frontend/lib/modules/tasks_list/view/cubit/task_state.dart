part of 'task_cubit.dart';

abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<TaskEntity> tasks;

  TaskLoaded(this.tasks);
}

class TaskError extends TaskState {
  final String error;

  TaskError(this.error);
}

class TaskAdded extends TaskLoaded {
  final TaskEntity addedTask;

  TaskAdded(this.addedTask, super.tasks);
}

class TaskUpdated extends TaskLoaded {
  final TaskEntity updatedTask;

  TaskUpdated(this.updatedTask, super.tasks);
}

class TaskDeleted extends TaskLoaded {
  final String deletedTaskId;

  TaskDeleted(this.deletedTaskId, super.tasks);
}
