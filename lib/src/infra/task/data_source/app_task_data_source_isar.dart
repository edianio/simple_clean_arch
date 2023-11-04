import 'package:isar/isar.dart';
import 'package:simple_clean_arch/src/data/task/data_source/app_task_data_source.dart';
import 'package:simple_clean_arch/src/data/task/model/app_task_dto.dart';
import 'package:simple_clean_arch/src/infra/services/isar_services.dart';

class AppTaskDataSourceIsar implements AppTaskDataSource{
  final IsarServices _isarServices;

  const AppTaskDataSourceIsar(this._isarServices);

  @override
  Future<void> deleteTask(int id) async {
    final isar = await _isarServices.isar;
    await isar.writeTxn(() async => await isar.appTaskDtos.delete(id));
  }

  @override
  Future<List<AppTaskDto>> getTasks() async {
    final isar = await _isarServices.isar;
    return isar.appTaskDtos.where().findAll();
  }

  @override
  Future<void> addTask(AppTaskDto task) => _saveTask(task);

  @override
  Future<void> updateTask(AppTaskDto task) => _saveTask(task);

  Future<void> _saveTask(AppTaskDto task) async {
    final isar = await _isarServices.isar;
    await isar.writeTxn<int>(() async => await isar.appTaskDtos.put(task));
  }
}