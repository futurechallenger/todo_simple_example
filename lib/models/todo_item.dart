class TodoItem {
  final String id;
  final String title;
  bool completed;
  int createdAt;

  TodoItem({
    required this.id,
    required this.title,
    this.completed = false,
    int? currentTimestamp,
  }) : createdAt = currentTimestamp ?? DateTime.now().millisecondsSinceEpoch;

  void toggleCompleted() {
    completed = !completed;
  }
}
