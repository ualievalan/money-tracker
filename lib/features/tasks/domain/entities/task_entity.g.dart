part of 'task_entity.dart';

_$TaskEntityImpl _$$TaskEntityImplFromJson(Map<String, dynamic> json) =>
    _$TaskEntityImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      isDone: json['isDone'] as bool,
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      priority:
          $enumDecodeNullable(_$TaskPriorityEnumMap, json['priority']) ??
          TaskPriority.medium,
      reminderAt: json['reminderAt'] == null
          ? null
          : DateTime.parse(json['reminderAt'] as String),
      repeat:
          $enumDecodeNullable(_$TaskRepeatEnumMap, json['repeat']) ??
          TaskRepeat.none,
    );

Map<String, dynamic> _$$TaskEntityImplToJson(_$TaskEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isDone': instance.isDone,
      'deadline': instance.deadline?.toIso8601String(),
      'priority': _$TaskPriorityEnumMap[instance.priority]!,
      'reminderAt': instance.reminderAt?.toIso8601String(),
      'repeat': _$TaskRepeatEnumMap[instance.repeat]!,
    };

const _$TaskPriorityEnumMap = {
  TaskPriority.low: 'low',
  TaskPriority.medium: 'medium',
  TaskPriority.high: 'high',
};

const _$TaskRepeatEnumMap = {
  TaskRepeat.none: 'none',
  TaskRepeat.daily: 'daily',
  TaskRepeat.weekly: 'weekly',
  TaskRepeat.monthly: 'monthly',
};
