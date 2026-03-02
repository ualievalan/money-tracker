import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:money_tracker/core/localization/app_localizations.dart';
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
    final loc = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(loc.tasks)),
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
                isOverdue ? loc.taskOverdue : loc.taskDone,
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
        final loc = AppLocalizations.of(context);
        return AlertDialog(
          title: Text(loc.newTaskTitle),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: loc.enterTask),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(loc.cancel),
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
              child: Text(loc.add),
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
        final loc = AppLocalizations.of(context);
        return AlertDialog(
          title: Text(loc.editTaskTitle),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: loc.enterTask),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(loc.cancel),
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
              child: Text(loc.save),
            ),
          ],
        );
      },
    );
  }
}
