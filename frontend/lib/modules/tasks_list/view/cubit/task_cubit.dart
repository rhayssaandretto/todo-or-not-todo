import 'package:frontend/app_imports.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final ITaskRepository taskRepository;

// TODO: tirar consoles

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
      final json = TaskMapper.toJson(task);
      debugPrint('Payload enviado para o backend: $json');

      await taskRepository.addTask(task);
      emit(TaskAdded());
      fetchTasks();
    } catch (e) {
      debugPrint('Erro ao adicionar tarefa: $e');
      debugPrint('Stack trace: ${StackTrace.current}');
      emit(TaskError(e.toString()));
    }
  }

  Future<void> updateTask(TaskEntity task) async {
    if (state is TaskLoaded) {
      try {
        await taskRepository.updateTask(task);

        final currentState = state as TaskLoaded;
        final updatedTasks = currentState.tasks.map((t) {
          return t.id == task.id ? task : t;
        }).toList();

        emit(TaskLoaded(updatedTasks));
        emit(TaskUpdated(task));
        emit(TaskLoaded(updatedTasks));
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
        final updatedTasks =
            currentState.tasks.where((task) => task.id != taskId).toList();

        emit(TaskLoaded(updatedTasks));
        emit(TaskDeleted(taskId));
        emit(TaskLoaded(updatedTasks));
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
        final updatedTasks = currentState.tasks.map((t) {
          return t.id == task.id ? updatedTask : t;
        }).toList();
        emit(TaskLoaded(updatedTasks));
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    }
  }
}
