import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/features/tasks/domain/entities/task_enums.dart';

part 'task_entity.freezed.dart';
part 'task_entity.g.dart';

@freezed
class TaskEntity with _$TaskEntity {
  const factory TaskEntity({
    required String id,
    required String title,
    required bool isDone,
    DateTime? deadline,
    @Default(TaskPriority.medium) TaskPriority priority,
    DateTime? reminderAt,
    @Default(TaskRepeat.none) TaskRepeat repeat,
  }) = _TaskEntity;

  factory TaskEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskEntityFromJson(json);
}

