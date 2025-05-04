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

class TaskAdded extends TaskState {}

class TaskUpdated extends TaskState {
  final TaskEntity updatedTask;

  TaskUpdated(this.updatedTask);
}

class TaskDeleted extends TaskState {
  final String deletedTaskId;

  TaskDeleted(this.deletedTaskId);
}
