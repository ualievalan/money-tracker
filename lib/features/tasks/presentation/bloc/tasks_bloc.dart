import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:money_tracker/features/tasks/domain/entities/task_entity.dart';
import 'package:money_tracker/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:money_tracker/features/tasks/presentation/bloc/tasks_event.dart';
import 'package:money_tracker/features/tasks/presentation/bloc/tasks_state.dart';

@injectable
class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc(this._repository) : super(const TasksState(tasks: [])) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTask>(_onAddTask);
    on<EditTask>(_onEditTask);
    on<ToggleTaskStatus>(_onToggleTaskStatus);
    on<DeleteTask>(_onDeleteTask);

    add(LoadTasks());
  }

  final TasksRepository _repository;

  Future<void> _onLoadTasks(LoadTasks event, Emitter<TasksState> emit) async {
    final loaded = await _repository.loadTasks();
    emit(state.copyWith(tasks: loaded));
  }

  Future<void> _onAddTask(AddTask event, Emitter<TasksState> emit) async {
    final updated = List<TaskEntity>.from(state.tasks);
    updated.insert(
      0,
      TaskEntity(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        title: event.title,
        isDone: false,
        deadline: event.deadline,
        priority: event.priority,
        reminderAt: event.reminderAt,
        repeat: event.repeat,
      ),
    );
    emit(state.copyWith(tasks: updated));
    await _repository.saveTasks(updated);
  }

  Future<void> _onEditTask(EditTask event, Emitter<TasksState> emit) async {
    final updated = List<TaskEntity>.from(state.tasks);
    if (event.index < 0 || event.index >= updated.length) return;

    updated[event.index] = updated[event.index].copyWith(title: event.title);
    emit(state.copyWith(tasks: updated));
    await _repository.saveTasks(updated);
  }

  Future<void> _onToggleTaskStatus(
    ToggleTaskStatus event,
    Emitter<TasksState> emit,
  ) async {
    final updated = List<TaskEntity>.from(state.tasks);
    if (event.index < 0 || event.index >= updated.length) return;

    final task = updated[event.index];
    updated[event.index] = task.copyWith(isDone: !task.isDone);
    emit(state.copyWith(tasks: updated));
    await _repository.saveTasks(updated);
  }

  Future<void> _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) async {
    final updated = List<TaskEntity>.from(state.tasks)
      ..removeWhere((t) => t.id == event.id);
    emit(state.copyWith(tasks: updated));
    await _repository.saveTasks(updated);
  }
}
