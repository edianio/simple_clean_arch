import 'package:simple_clean_arch/src/data/task/model/app_task_dto.dart';

abstract class AppTaskDataSource{
  Future<List<AppTaskDto>> getTasks();
  Future<void> addTask(AppTaskDto task);
  Future<void> updateTask(AppTaskDto task);
  Future<void> deleteTask(int id);
}