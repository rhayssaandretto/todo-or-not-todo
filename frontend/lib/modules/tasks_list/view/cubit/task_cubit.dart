import 'package:frontend/app_imports.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final ITaskRepository taskRepository;

  TaskCubit(this.taskRepository) : super(TaskInitial());

  Future<void> fetchTasks() async {
    emit(TaskLoading());
    try {
      final tasks = await taskRepository.getAllTasks();

      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  Future<void> addTask(TaskEntity task) async {
    try {
      await taskRepository.addTask(task);

      final currentState = state as TaskLoaded;
      List<TaskEntity>.from(currentState.tasks).add(task);

      await _updateList();
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  Future<void> updateTask(TaskEntity task) async {
    if (state is TaskLoaded) {
      try {
        await taskRepository.updateTask(task);

        final currentState = state as TaskLoaded;
        final updatedTasksList = currentState.tasks.map((t) {
          return t.id == task.id ? task : t;
        }).toList();

        emit(TaskUpdated(task, updatedTasksList));
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    }
  }

  Future<void> deleteTask(String taskId) async {
    if (state is TaskLoaded) {
      try {
        await taskRepository.deleteTask(taskId);

        final currentState = state as TaskLoaded;
        final deletedTasksList =
            currentState.tasks.where((task) => task.id != taskId).toList();

        emit(TaskDeleted(taskId, deletedTasksList));
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    }
  }

  Future<void> toggleCompletion(TaskEntity task) async {
    if (state is TaskLoaded) {
      try {
        final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
        await taskRepository.updateTask(updatedTask);

        final currentState = state as TaskLoaded;
        final updatedTasksList = currentState.tasks.map((t) {
          return t.id == task.id ? updatedTask : t;
        }).toList();

        emit(TaskLoaded(updatedTasksList));
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    }
  }

  Future<void> _updateList() async {
    final newTaskList = await taskRepository.getAllTasks();
    emit(TaskLoaded(newTaskList));
  }
}
