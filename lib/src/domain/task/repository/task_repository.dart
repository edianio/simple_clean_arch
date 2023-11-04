import 'package:simple_clean_arch/src/domain/task/entities/app_task.dart';

abstract class TaskRepository {
  Future<List<AppTask>> getTasks();
  // Future<AppTask> getTask(String id);
  Future<void> addTask(AppTask task);
  Future<void> updateTask(AppTask task);
  Future<void> deleteTask(int id);
}