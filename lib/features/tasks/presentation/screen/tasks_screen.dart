import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final List<Map<String, dynamic>> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString('tasks');
    if (raw == null) return;

    final decoded = jsonDecode(raw) as List<dynamic>;
    setState(() {
      tasks
        ..clear()
        ..addAll(decoded.map((e) => Map<String, dynamic>.from(e)));
    });
  }

  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('tasks', jsonEncode(tasks));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Дела')),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          final isOverdue = task["status"] == "overdue";

          return Dismissible(
            key: ValueKey('${task["title"]}-$index'),
            direction: DismissDirection.horizontal,
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                _showEditTaskDialog(index);
                return false;
              }
              return await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Удалить задачу?'),
                      content: const Text('Это действие нельзя отменить.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('Отмена'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('Удалить'),
                        ),
                      ],
                    ),
                  ) ??
                  false;
            },
            onDismissed: (_) {
              setState(() {
                tasks.removeAt(index);
              });
              _saveTasks();
            },
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.red.withValues(alpha: 0.2),
              child: const Icon(Icons.delete, color: Colors.red),
            ),
            child: GestureDetector(
              onTap: () {
                _showEditTaskDialog(index);
              },
              child: ListTile(
                leading: IconButton(
                  onPressed: () {
                    setState(() {
                      if (task["status"] == "overdue") {
                        task["status"] = "done";
                      } else {
                        task["status"] = "overdue";
                      }
                    });
                    _saveTasks();
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
                title: Text(
                  task["title"].toString(),
                  style: TextStyle(
                    decoration: task["status"] == "done"
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: task["status"] == "done" ? Colors.grey : null,
                  ),
                ),
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
      ),
    );
  }

  void _showAddTaskDialog() {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Новая задача'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Введите задачу'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                final text = controller.text.trim();
                if (text.isNotEmpty) {
                  setState(() {
                    tasks.insert(0, {"title": text, "status": "overdue"});
                  });
                  _saveTasks();
                }
                Navigator.pop(context);
              },
              child: const Text('Добавить'),
            ),
          ],
        );
      },
    );
  }

  void _showEditTaskDialog(int index) {
    final controller = TextEditingController(
      text: tasks[index]["title"].toString(),
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Редактировать задачу'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Введите задачу'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                final text = controller.text.trim();
                if (text.isNotEmpty) {
                  setState(() {
                    tasks[index]["title"] = text;
                  });
                  _saveTasks();
                }
                Navigator.pop(context);
              },
              child: const Text('Сохранить'),
            ),
          ],
        );
      },
    );
  }
}
