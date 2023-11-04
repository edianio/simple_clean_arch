import 'package:simple_clean_arch/src/data/task/data_source/app_task_data_source.dart';
import 'package:simple_clean_arch/src/data/task/model/app_task_dto.dart';
import 'package:simple_clean_arch/src/domain/task/entities/app_task.dart';
import 'package:simple_clean_arch/src/domain/task/repository/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository{
  final AppTaskDataSource _dataSource;

  const TaskRepositoryImpl(this._dataSource);

  @override
  Future<void> addTask(AppTask task) async {
    await _dataSource.addTask(AppTaskDto.fromEntity(task));
  }

  @override
  Future<void> deleteTask(int id) async{
    await _dataSource.deleteTask(id);
  }

  @override
  Future<List<AppTask>> getTasks() async {
    final result = await _dataSource.getTasks();
    return result.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> updateTask(AppTask task) async {
    await _dataSource.updateTask(AppTaskDto.fromEntity(task));
  }
}