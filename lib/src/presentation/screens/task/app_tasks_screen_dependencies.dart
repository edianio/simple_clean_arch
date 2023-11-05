import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_clean_arch/src/modules/service_locator_setup.dart';
import 'package:simple_clean_arch/src/presentation/screens/task/app_tasks_screen.dart';
import 'package:simple_clean_arch/src/presentation/screens/task/bloc/app_task_bloc.dart';
import 'package:simple_clean_arch/src/presentation/screens/task/bloc/app_task_event.dart';

class AppTasksScreenDependencies{
  Widget build(BuildContext context){
    return BlocProvider<AppTaskBloc>(
      create: (context) => AppTaskBloc(
        getIt(),
        getIt(),
        getIt(),
        getIt(),
      )..add(GetTasksEvent()),
      child: const AppTasksScreen(),
    );
  }
}