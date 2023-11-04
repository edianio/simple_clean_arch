import 'package:simple_clean_arch/src/infra/services/isar_services.dart';
import 'package:simple_clean_arch/src/modules/service_locator_setup.dart';

void serviceLocatorIsar(){
  getIt.registerSingleton<IsarServices>(IsarServices());
}