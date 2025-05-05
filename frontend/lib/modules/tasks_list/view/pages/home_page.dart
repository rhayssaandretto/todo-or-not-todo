import '../../../../app_imports.dart';
import '../cubit/task_cubit.dart';

class HomePage extends StatelessWidget {
  static const String name = "/home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ServiceLocator.locator<TaskCubit>()..fetchTasks(),
      child: BlocConsumer<TaskCubit, TaskState>(
        listener: (context, state) {
          if (state is TaskUpdated) {
            _showSnackBar(context,
                'Task "${state.updatedTask.title}" updated successfully!');
          } else if (state is TaskDeleted) {
            _showSnackBar(context, 'Task deleted successfully!');
          } else if (state is TaskError) {
            _showSnackBar(context, 'Error: ${state.error}');
          }
        },
        builder: (context, state) {
          if (state is TaskLoading || state is TaskInitial) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (state is TaskLoaded) {
            final body = state.tasks.isEmpty
                ? const EmptyStateWidget()
                : TaskListWidget(tasks: state.tasks);

            return ScaffoldWidget(body: body);
          }

          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Something went wrong."),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.read<TaskCubit>().fetchTasks(),
                    child: const Text("Retry"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ));
  }
}
