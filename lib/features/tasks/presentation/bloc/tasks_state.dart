class TasksState {
  const TasksState({required this.tasks});
  final List<Map<String, dynamic>> tasks;

  TasksState copyWith({List<Map<String, dynamic>>? tasks}) {
    return TasksState(tasks: tasks ?? this.tasks);
  }
}
