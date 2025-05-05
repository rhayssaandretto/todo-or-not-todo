import '../../../../app_imports.dart';

class TaskListWidget extends StatelessWidget {
  final List<TaskEntity> tasks;

  const TaskListWidget({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 600;

        return ListView.separated(
          padding: EdgeInsets.symmetric(
              horizontal: isWide ? constraints.maxWidth * 0.15 : 8),
          itemCount: tasks.length,
          itemBuilder: (context, index) => TaskTile(task: tasks[index]),
          separatorBuilder: (context, index) => const Divider(
            color: Colors.black,
            thickness: 1,
            indent: 50,
          ),
        );
      },
    );
  }
}
