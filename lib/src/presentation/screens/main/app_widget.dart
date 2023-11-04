import 'package:flutter/material.dart';
import 'package:simple_clean_arch/src/presentation/screens/task/app_tasks_screen_dependencies.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Clean Arch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppTasksScreenDependencies().build(context),
    );
  }
}
