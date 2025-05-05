import '../../../../app_imports.dart';
import '../cubit/task_cubit.dart';

class TaskTile extends StatelessWidget {
  final TaskEntity task;

  const TaskTile({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          color: task.isCompleted ? Colors.grey : Colors.black,
          fontSize: screenWidth < 600 ? 16 : 20,
        ),
      ),
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: (value) {
          context.read<TaskCubit>().toggleCompletion(task);
        },
        activeColor: const Color(0xFFFFD1DC),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: () {
          _showAddTodoBox(context);
        },
      ),
    );
  }

  void _showAddTodoBox(BuildContext context) {
    final taskCubit = context.read<TaskCubit>();
    final textController = TextEditingController(text: task.title);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Task'),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
            labelText: 'Task Title',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.pink),
              )),
          TextButton(
            onPressed: () {
              if (textController.text.trim().isNotEmpty) {
                final updatedTask =
                    task.copyWith(title: textController.text.trim());
                taskCubit.updateTask(updatedTask);
              }
              Navigator.of(context).pop();
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.pink),
            ),
          ),
          TextButton(
            onPressed: () {
              taskCubit.deleteTask(task.id);
              Navigator.of(context).pop();
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.pink),
            ),
          ),
        ],
      ),
    );
  }
}
