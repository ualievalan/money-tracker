import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/features/tasks/domain/entities/task_entity.dart';

part 'tasks_state.freezed.dart';

@freezed
class TasksState with _$TasksState {
  const factory TasksState({
    required List<TaskEntity> tasks,
  }) = _TasksState;
}
