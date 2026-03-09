import 'package:money_tracker/features/tasks/domain/entities/task_entity.dart';

class TasksState {
  const TasksState({required this.tasks});

  final List<TaskEntity> tasks;

  TasksState copyWith({List<TaskEntity>? tasks}) {
    return TasksState(tasks: tasks ?? this.tasks);
  }
}
