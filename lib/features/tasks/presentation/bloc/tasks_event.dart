import 'package:money_tracker/features/tasks/domain/entities/task_enums.dart';

abstract class TasksEvent {}

class LoadTasks extends TasksEvent {}

class AddTask extends TasksEvent {
  AddTask({
    required this.title,
    this.deadline,
    this.priority = TaskPriority.medium,
    this.reminderAt,
    this.repeat = TaskRepeat.none,
  });

  final String title;
  final DateTime? deadline;
  final TaskPriority priority;
  final DateTime? reminderAt;
  final TaskRepeat repeat;
}

class EditTask extends TasksEvent {
  EditTask(this.index, this.title);

  final int index;
  final String title;
}

class ToggleTaskStatus extends TasksEvent {
  ToggleTaskStatus(this.index);

  final int index;
}

class DeleteTask extends TasksEvent {
  DeleteTask(this.id);

  final String id;
}
