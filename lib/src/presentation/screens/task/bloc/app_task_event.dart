import 'package:simple_clean_arch/src/domain/task/entities/app_task.dart';

sealed class AppTaskEvent {}

class AddTaskEvent implements AppTaskEvent {
  final AppTask task;

  const AddTaskEvent(this.task);
}

class UpdateTaskEvent implements AppTaskEvent {
  final AppTask task;

  const UpdateTaskEvent(this.task);
}

class DeleteTaskEvent implements AppTaskEvent {
  final int id;

  const DeleteTaskEvent(this.id);
}

class GetTasksEvent implements AppTaskEvent {}
