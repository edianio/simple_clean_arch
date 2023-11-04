import 'package:simple_clean_arch/src/domain/task/entities/app_task.dart';
import 'package:simple_clean_arch/src/domain/task/repository/task_repository.dart';

class GetTasks{
  final TaskRepository _repository;

  const GetTasks(this._repository);

  Future<List<AppTask>> call() {
    return _repository.getTasks();
  }
}