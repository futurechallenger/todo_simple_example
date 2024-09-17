import 'package:flutter/material.dart';
import 'package:todo_simple_example/widgets/single_choice_toggle.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SingleChoiceToggle(),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: _itemBuilder,
              itemCount: _itemList.length,
            ),
          )
        ],
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

    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 50.0,
              color: Colors.amber,
              child: Center(
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.radio_button_off)))),
          Expanded(
              flex: 1,
              child: Container(
                  height: 50.0,
                  color: Colors.blue,
                  child: Center(
                      child: Text(
                    item.title,
                    style: const TextStyle(fontSize: 21.0),
                  )))),
          Container(
              height: 50.0,
              color: Colors.yellow,
              child: const Center(child: Text('tailing'))),
        ]);
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
