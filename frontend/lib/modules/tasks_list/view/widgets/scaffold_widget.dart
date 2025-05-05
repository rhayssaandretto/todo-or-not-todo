import '../../../../app_imports.dart';

class ScaffoldWidget extends StatelessWidget {
  final Widget body;

  const ScaffoldWidget({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("What TODO today? ¯\\_(ツ)_/¯")),
      ),
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 600;

          return Column(
            children: [
              Expanded(child: body),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isWide ? constraints.maxWidth * 0.15 : 8.0,
                    vertical: 8.0,
                  ),
                  child: const InputFieldWidget(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
