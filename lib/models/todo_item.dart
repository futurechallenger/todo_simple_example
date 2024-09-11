class TodoItem {
  final String id;
  final String title;
  bool completed;

  TodoItem({required this.id, required this.title, this.completed = false});

  void toggleCompleted() {
    completed = !completed;
  }
}
