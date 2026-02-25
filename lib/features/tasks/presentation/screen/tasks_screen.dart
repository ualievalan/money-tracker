import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final List<Map<String, dynamic>> tasks = [];

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

          return GestureDetector(
            onTap: () {
              _showEditTaskDialog(index);
            },
            child: ListTile(
              leading: IconButton(
                onPressed: () {
                  setState(() {
                    if (task["status"] == "overdue") {
                      task["status"] = "done";
                    }
                  });
                },
                icon: Icon(
                  task["status"] == "done"
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                  color: task["status"] == "done" ? Colors.green : Colors.grey,
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
                style: TextStyle(color: isOverdue ? Colors.red : Colors.green),
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
