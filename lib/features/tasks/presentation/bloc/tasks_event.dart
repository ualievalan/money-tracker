abstract class TasksEvent {}

class LoadTasks extends TasksEvent {}

class AddTask extends TasksEvent {
  AddTask(this.title);
  final String title;
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
