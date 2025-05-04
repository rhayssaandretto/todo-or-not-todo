import '../../../../app_imports.dart';
import '../cubit/task_cubit.dart';

class TaskListsPage extends StatelessWidget {
  static const String name = "/tasks-list";
  final _formKey = GlobalKey<FormState>();

  TaskListsPage({super.key});

  // TODO: refatorar tudo

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceLocator.locator<TaskCubit>()..fetchTasks(),
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
          } else if (state is TaskLoaded) {
            final body = state.tasks.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          'Everything is so calm here... No tasks yet!',
                          style: GoogleFonts.schoolbell(
                            fontSize: 22,
                            color: Colors.pink,
                          ),
                        ),
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) {
                      final task = state.tasks[index];
                      return _buildTaskTile(context, task);
                    },
                  );
            return _buildScaffold(context, body);
          } else if (state is TaskUpdated) {
            final currentState = context.read<TaskCubit>().state as TaskLoaded;
            final body = currentState.tasks.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          'Everything is so calm here... No tasks yet!',
                          style: GoogleFonts.schoolbell(
                            fontSize: 22,
                            color: Colors.pink,
                          ),
                        ),
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: currentState.tasks.length,
                    itemBuilder: (context, index) {
                      final task = currentState.tasks[index];
                      return _buildTaskTile(context, task);
                    },
                  );

            return _buildScaffold(context, body);
          } else {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Something went wrong."),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<TaskCubit>().fetchTasks();
                      },
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Widget _buildScaffold(BuildContext context, Widget body) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("What TODO today? ¯\\_(ツ)_/¯"),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: body),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildInputField(context),
          )
        ],
      ),
    );
  }

  Widget _buildTaskTile(BuildContext context, TaskEntity task) {
    return TaskTile(task: task);
  }

  Widget _buildInputField(BuildContext context) {
    final textController = TextEditingController();

    return Form(
      key: _formKey,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: const Text(
                'TODO',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: textController,
                cursorColor: const Color(0xFFFFD1DC),
                decoration: const InputDecoration(
                  hintText: 'a new task...',
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Task title cannot be empty!';
                  }
                  return null;
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final taskTitle = textController.text.trim();
                  debugPrint('Adicionando tarefa: $taskTitle');

                  try {
                    final newTask = TaskEntity(
                        id: '', title: taskTitle, isCompleted: false);

                    context.read<TaskCubit>().addTask(newTask);
                    textController.clear();
                  } catch (e, stack) {
                    debugPrint('Erro ao adicionar tarefa: $e');
                    debugPrint('Stack trace: $stack');

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Erro ao adicionar a tarefa!')),
                    );
                  }
                } else {
                  debugPrint('Validação falhou: título da tarefa vazio.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
