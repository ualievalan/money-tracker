import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      create: (_) => TasksBloc(),
      child: Builder(
        builder: (blocContext) {
          return Scaffold(
            appBar: AppBar(title: const Text('Дела')),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _showAddTaskDialog(blocContext),
              child: const Icon(Icons.add),
            ),
            body: BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                final tasks = state.tasks;

                return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    final isOverdue = task["status"] == "overdue";

                    return Dismissible(
                      key: ValueKey(
                        task["id"]?.toString() ?? '${task["title"]}-$index',
                      ),
                      direction: DismissDirection.horizontal,
                      confirmDismiss: (direction) =>
                          _handleDismiss(blocContext, direction, index),
                      onDismissed: (_) =>
                          _deleteTask(blocContext, task["id"].toString()),

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
                            onPressed: () {
                              blocContext.read<TasksBloc>().add(
                                ToggleTaskStatus(index),
                              );
                            },
                            icon: Icon(
                              task["status"] == "done"
                                  ? Icons.check_circle
                                  : Icons.radio_button_unchecked,
                              color: task["status"] == "done"
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          ),
                          title: Text(task["title"].toString()),
                          trailing: Text(
                            isOverdue ? "Просрочено" : "Выполнено",
                            style: TextStyle(
                              color: isOverdue ? Colors.red : Colors.green,
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

  void _showAddTaskDialog(BuildContext context) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Новая задача'),
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
                  context.read<TasksBloc>().add(AddTask(text));
                }
                Navigator.pop(dialogContext);
              },
              child: const Text('Добавить'),
            ),
          ],
        );
      },
    );
  }

  void _showEditTaskDialog(BuildContext context, int index) {
    final task = context.read<TasksBloc>().state.tasks[index];
    final controller = TextEditingController(text: task["title"].toString());

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
}
