import 'package:money_tracker/features/tasks/domain/entities/task_entity.dart';

abstract interface class TasksRepository {
  Future<List<TaskEntity>> loadTasks();
  Future<void> saveTasks(List<TaskEntity> tasks);
}
