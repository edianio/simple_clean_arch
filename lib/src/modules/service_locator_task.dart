import 'package:simple_clean_arch/src/data/task/data_source/app_task_data_source.dart';
import 'package:simple_clean_arch/src/data/task/repository/task_repository_impl.dart';
import 'package:simple_clean_arch/src/domain/task/repository/task_repository.dart';
import 'package:simple_clean_arch/src/domain/task/use_cases/add_task.dart';
import 'package:simple_clean_arch/src/domain/task/use_cases/delete_task.dart';
import 'package:simple_clean_arch/src/domain/task/use_cases/get_tasks.dart';
import 'package:simple_clean_arch/src/domain/task/use_cases/update_task.dart';
import 'package:simple_clean_arch/src/infra/task/data_source/app_task_data_source_isar.dart';
import 'package:simple_clean_arch/src/modules/service_locator_setup.dart';

void serviceLocatorTask(){
  // DATA SOURCES
  getIt.registerLazySingleton<AppTaskDataSource>(() => AppTaskDataSourceIsar(getIt()));
  // REPOSITORIES
  getIt.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(getIt()));
  // USE CASES
  getIt.registerLazySingleton<AddTask>(() => AddTask(getIt()));
  getIt.registerLazySingleton<GetTasks>(() => GetTasks(getIt()));
  getIt.registerLazySingleton<DeleteTask>(() => DeleteTask(getIt()));
  getIt.registerLazySingleton<UpdateTask>(() => UpdateTask(getIt()));
}