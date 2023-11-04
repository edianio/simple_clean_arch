import 'package:simple_clean_arch/src/domain/task/repository/task_repository.dart';

class DeleteTask{
  final TaskRepository _repository;

  const DeleteTask(this._repository);

  Future<void> call(int id) {
    return _repository.deleteTask(id);
  }
}