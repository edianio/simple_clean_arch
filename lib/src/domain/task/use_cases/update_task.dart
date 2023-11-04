import 'package:simple_clean_arch/src/domain/task/entities/app_task.dart';
import 'package:simple_clean_arch/src/domain/task/repository/task_repository.dart';

class UpdateTask {
  final TaskRepository _repository;

  const UpdateTask(this._repository);

  Future<void> call(AppTask task) {
    return _repository.updateTask(task);
  }
}