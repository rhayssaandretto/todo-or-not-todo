import '../../../../app_imports.dart';
import '../cubit/task_cubit.dart';

class InputFieldWidget extends StatefulWidget {
  const InputFieldWidget({super.key});

  @override
  State<InputFieldWidget> createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.only(left: 0, right: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(right: 4, left: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(2),
              ),
              child: const Text(
                'TODO',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: _textController,
                cursorColor: const Color(0xFFFFD1DC),
                decoration: const InputDecoration(
                  hintText: 'a new task...',
                  border: InputBorder.none,
                ),
                validator: (value) => (value == null || value.trim().isEmpty)
                    ? 'Task title cannot be empty!'
                    : null,
                onFieldSubmitted: (_) => _addTask(),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _addTask,
            ),
          ],
        ),
      ),
    );
  }

  void _addTask() {
    if (_formKey.currentState!.validate()) {
      final taskTitle = _textController.text.trim();
      final newTask = TaskEntity(id: '', title: taskTitle, isCompleted: false);
      context.read<TaskCubit>().addTask(newTask);
      _textController.clear();
    }
  }
}
