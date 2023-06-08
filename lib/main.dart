import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              QuillToolbar.basic(controller: _controller),
              Expanded(
                // Expandedだけだとレイアウトエラーが起こるのでLayoutBuilderを利用
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return QuillEditor.basic(
                      controller: _controller,
                      readOnly: false,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
