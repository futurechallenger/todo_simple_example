import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:todo_simple_example/models/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TodoItem> _itemList = [];
  final _uuid = const Uuid();

  void _addItem(String title) {
    final item = TodoItem(id: _uuid.v1(), title: title, completed: false);
    setState(() {
      _itemList.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: _itemBuilder,
        itemCount: _itemList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showInput(context);
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final item = _itemList[index];

    return ListTile(
      title: Text(item.title),
    );
  }

  void _showInput(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          String todoTitle = '';
          return AlertDialog(
            title: const Text("Add New Todo"),
            content: TextField(
              onChanged: (value) {
                todoTitle = value;
              },
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    if (todoTitle.isEmpty) {
                      return;
                    }

                    _addItem(todoTitle);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Add')),
            ],
          );
        });
  }
}
