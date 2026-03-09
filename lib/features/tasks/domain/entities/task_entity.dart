class TaskEntity {
  const TaskEntity({
    required this.id,
    required this.title,
    required this.isDone,
    this.deadline,
    this.priority = TaskPriority.medium,
    this.reminderAt,
    this.repeat = TaskRepeat.none,
  });

  final String id;
  final String title;
  final bool isDone;
  final DateTime? deadline;
  final TaskPriority priority;
  final DateTime? reminderAt;
  final TaskRepeat repeat;

  TaskEntity copyWith({
    String? id,
    String? title,
    bool? isDone,
    DateTime? deadline,
    bool clearDeadline = false,
    TaskPriority? priority,
    DateTime? reminderAt,
    bool clearReminderAt = false,
    TaskRepeat? repeat,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      deadline: clearDeadline ? null : (deadline ?? this.deadline),
      priority: priority ?? this.priority,
      reminderAt: clearReminderAt ? null : (reminderAt ?? this.reminderAt),
      repeat: repeat ?? this.repeat,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'isDone': isDone,
        'deadline': deadline?.toIso8601String(),
        'priority': priority.name,
        'reminderAt': reminderAt?.toIso8601String(),
        'repeat': repeat.name,
      };

  factory TaskEntity.fromJson(Map<String, dynamic> json) {
    return TaskEntity(
      id: json['id'].toString(),
      title: json['title']?.toString() ?? '',
      isDone: json['isDone'] == true,
      deadline: json['deadline'] != null
          ? DateTime.tryParse(json['deadline'].toString())
          : null,
      priority: TaskPriority.values.firstWhere(
        (e) => e.name == json['priority'],
        orElse: () => TaskPriority.medium,
      ),
      reminderAt: json['reminderAt'] != null
          ? DateTime.tryParse(json['reminderAt'].toString())
          : null,
      repeat: TaskRepeat.values.firstWhere(
        (e) => e.name == json['repeat'],
        orElse: () => TaskRepeat.none,
      ),
    );
  }
}

enum TaskPriority { low, medium, high }

enum TaskRepeat { none, daily, weekly, monthly }
