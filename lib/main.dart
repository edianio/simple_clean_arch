import 'package:flutter/material.dart';
import 'package:simple_clean_arch/src/modules/service_locator_setup.dart';
import 'package:simple_clean_arch/src/presentation/screens/main/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  serviceLocatorSetup();

  runApp(const AppWidget());
}
