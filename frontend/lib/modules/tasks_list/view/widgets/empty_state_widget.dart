import '../../../../app_imports.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Padding(
      padding: EdgeInsets.all(16),
      child: FittedBox(
        child: Text(
          'Everything is so calm here... No tasks yet!',
          style: TextStyle(fontSize: 20, color: Colors.pink),
        ),
      ),
    ));
  }
}
