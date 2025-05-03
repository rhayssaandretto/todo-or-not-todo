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
}
