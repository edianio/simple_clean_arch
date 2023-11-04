import 'package:get_it/get_it.dart';
import 'package:simple_clean_arch/src/modules/service_locator_isar.dart';
import 'package:simple_clean_arch/src/modules/service_locator_task.dart';

final GetIt getIt = GetIt.instance;

void serviceLocatorSetup(){
  serviceLocatorIsar();
  serviceLocatorTask();
}