import 'package:simple_clean_arch/src/domain/task/entities/app_task.dart';

sealed class AppTaskState{}

class AppTaskLoadingState implements AppTaskState {}

class AppTaskLoadedState implements AppTaskState {
  final List<AppTask> tasks;

  const AppTaskLoadedState(this.tasks);
}

class AppTaskErrorState implements AppTaskState {
  final String message;

  const AppTaskErrorState(this.message);
}