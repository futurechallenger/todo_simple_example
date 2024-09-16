import 'package:flutter/material.dart';
import 'package:todo_simple_example/screens/home_page.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Todo Example'),
    );
  }
}
