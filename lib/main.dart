import 'package:flutter/material.dart';
import 'package:todo_simple_example/screens/home_page.dart';
import 'package:todo_simple_example/screens/settings_page.dart';

List<Widget> _pages = [
  const HomePage(
    title: 'Todo',
  ),
  SettingsPage(),
];

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const TodoApp());
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: _pages.elementAt(_selectedTabIndex),
        bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
            currentIndex: _selectedTabIndex,
            onTap: (int index) {
              setState(() {
                _selectedTabIndex = index;
              });
            }),
      ),
    );
  }
}
