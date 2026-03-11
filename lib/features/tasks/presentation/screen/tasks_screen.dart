import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/di/injection.dart';
import 'package:money_tracker/features/tasks/domain/entities/task_enums.dart';
import 'package:money_tracker/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:money_tracker/features/tasks/presentation/bloc/tasks_event.dart';
import 'package:money_tracker/features/tasks/presentation/bloc/tasks_state.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TasksBloc>(),
      child: Builder(
        builder: (blocContext) {
          return Scaffold(
            appBar: AppBar(title: const Text('Дела')),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _showAddTaskSheet(blocContext),
              child: const Icon(Icons.add),
            ),
            body: BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                final tasks = state.tasks;
                if (tasks.isEmpty) {
                  return const Center(child: Text('Пока нет задач'));
                }

                return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    final isOverdue =
                        !task.isDone &&
                        task.deadline != null &&
                        task.deadline!.isBefore(DateTime.now());

                    return Dismissible(
                      key: ValueKey(task.id),
                      direction: DismissDirection.horizontal,
                      confirmDismiss: (direction) =>
                          _handleDismiss(blocContext, direction, index),
                      onDismissed: (_) => _deleteTask(blocContext, task.id),
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        color: Colors.red.withValues(alpha: 0.2),
                        child: const Icon(Icons.delete, color: Colors.red),
                      ),
                      child: GestureDetector(
                        onTap: () => _showEditTaskDialog(blocContext, index),
                        child: ListTile(
                          leading: IconButton(
                            onPressed: () => blocContext.read<TasksBloc>().add(
                              ToggleTaskStatus(index),
                            ),
                            icon: Icon(
                              task.isDone
                                  ? Icons.check_circle
                                  : Icons.radio_button_unchecked,
                              color: task.isDone ? Colors.green : Colors.grey,
                            ),
                          ),
                          title: Text(
                            task.title,
                            style: TextStyle(
                              decoration: task.isDone
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          trailing: Text(
                            task.isDone
                                ? 'Выполнено'
                                : (isOverdue ? 'Просрочено' : 'Активно'),
                            style: TextStyle(
                              color: task.isDone
                                  ? Colors.green
                                  : (isOverdue ? Colors.red : Colors.blueGrey),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  Future<bool> _handleDismiss(
    BuildContext blocContext,
    DismissDirection direction,
    int index,
  ) async {
    if (direction == DismissDirection.startToEnd) {
      _showEditTaskDialog(blocContext, index);
      return false;
    }
    return _showDeleteConfirmDialog(blocContext);
  }

  Future<bool> _showDeleteConfirmDialog(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: const Text('Удалить задачу?'),
            content: const Text('Это действие нельзя отменить.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext, false),
                child: const Text('Отмена'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(dialogContext, true),
                child: const Text('Удалить'),
              ),
            ],
          ),
        ) ??
        false;
  }

  void _deleteTask(BuildContext context, String id) {
    context.read<TasksBloc>().add(DeleteTask(id));
  }

  void _showEditTaskDialog(BuildContext context, int index) {
    final task = context.read<TasksBloc>().state.tasks[index];
    final controller = TextEditingController(text: task.title);

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Редактировать задачу'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Введите задачу'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                final text = controller.text.trim();
                if (text.isNotEmpty) {
                  context.read<TasksBloc>().add(EditTask(index, text));
                }
                Navigator.pop(dialogContext);
              },
              child: const Text('Сохранить'),
            ),
          ],
        );
      },
    );
  }

  void _showAddTaskSheet(BuildContext context) {
    final controller = TextEditingController();
    DateTime? selectedDeadline;
    DateTime? selectedReminderAt;
    TaskPriority selectedPriority = TaskPriority.medium;
    TaskRepeat selectedRepeat = TaskRepeat.none;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (sheetContext, setSheetState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 12,
                right: 12,
                bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 12,
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(14, 10, 14, 14),
                decoration: BoxDecoration(
                  color: const Color(0xFF141518),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 44,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(99),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller,
                            autofocus: true,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Введите задачу...',
                              hintStyle: const TextStyle(color: Colors.white54),
                              filled: true,
                              fillColor: const Color(0xFF1E2024),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onSubmitted: (_) {
                              _submitTask(
                                context,
                                sheetContext,
                                controller.text,
                                selectedDeadline,
                                selectedPriority,
                                selectedReminderAt,
                                selectedRepeat,
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 46,
                          height: 46,
                          decoration: const BoxDecoration(
                            color: Color(0xFF0A56F0),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              _submitTask(
                                context,
                                sheetContext,
                                controller.text,
                                selectedDeadline,
                                selectedPriority,
                                selectedReminderAt,
                                selectedRepeat,
                              );
                            },
                            icon: const Icon(
                              Icons.send_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _actionChip(
                          icon: Icons.calendar_today_rounded,
                          label: 'Дедлайн',
                          onTap: () async {
                            final picked = await showDatePicker(
                              context: sheetContext,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null) {
                              setSheetState(() => selectedDeadline = picked);
                            }
                          },
                        ),
                        _actionChip(
                          icon: Icons.flag_circle_outlined,
                          label: 'Приоритет',
                          onTap: () async {
                            final picked = await _pickPriority(sheetContext);
                            if (picked != null) {
                              setSheetState(() => selectedPriority = picked);
                            }
                          },
                        ),
                        _actionChip(
                          icon: Icons.access_time_rounded,
                          label: 'Время',
                          onTap: () async {
                            final now = TimeOfDay.now();
                            final picked = await showTimePicker(
                              context: sheetContext,
                              initialTime: now,
                            );
                            if (picked != null) {
                              final today = DateTime.now();
                              setSheetState(() {
                                selectedReminderAt = DateTime(
                                  today.year,
                                  today.month,
                                  today.day,
                                  picked.hour,
                                  picked.minute,
                                );
                              });
                            }
                          },
                        ),
                        _actionChip(
                          icon: Icons.repeat_rounded,
                          label: 'Повторять',
                          onTap: () async {
                            final picked = await _pickRepeat(sheetContext);
                            if (picked != null) {
                              setSheetState(() => selectedRepeat = picked);
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _actionChip({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white24),
          color: const Color(0xFF1A1C20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: Colors.white70),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }

  Future<TaskPriority?> _pickPriority(BuildContext context) async {
    return showModalBottomSheet<TaskPriority>(
      context: context,
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Low'),
                onTap: () => Navigator.pop(ctx, TaskPriority.low),
              ),
              ListTile(
                title: const Text('Medium'),
                onTap: () => Navigator.pop(ctx, TaskPriority.medium),
              ),
              ListTile(
                title: const Text('High'),
                onTap: () => Navigator.pop(ctx, TaskPriority.high),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<TaskRepeat?> _pickRepeat(BuildContext context) async {
    return showModalBottomSheet<TaskRepeat>(
      context: context,
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('None'),
                onTap: () => Navigator.pop(ctx, TaskRepeat.none),
              ),
              ListTile(
                title: const Text('Daily'),
                onTap: () => Navigator.pop(ctx, TaskRepeat.daily),
              ),
              ListTile(
                title: const Text('Weekly'),
                onTap: () => Navigator.pop(ctx, TaskRepeat.weekly),
              ),
              ListTile(
                title: const Text('Monthly'),
                onTap: () => Navigator.pop(ctx, TaskRepeat.monthly),
              ),
            ],
          ),
        );
      },
    );
  }

  void _submitTask(
    BuildContext blocContext,
    BuildContext sheetContext,
    String rawTitle,
    DateTime? deadline,
    TaskPriority priority,
    DateTime? reminderAt,
    TaskRepeat repeat,
  ) {
    final title = rawTitle.trim();
    if (title.isEmpty) return;

    blocContext.read<TasksBloc>().add(
      AddTask(
        title: title,
        deadline: deadline,
        priority: priority,
        reminderAt: reminderAt,
        repeat: repeat,
      ),
    );

    Navigator.pop(sheetContext);
  }
}
