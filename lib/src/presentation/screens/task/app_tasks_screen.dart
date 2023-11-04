import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_clean_arch/src/domain/task/entities/app_task.dart';
import 'package:simple_clean_arch/src/presentation/screens/task/bloc/app_task_bloc.dart';
import 'package:simple_clean_arch/src/presentation/screens/task/bloc/app_task_state.dart';

class AppTasksScreen extends StatefulWidget {
  const AppTasksScreen({super.key});

  @override
  State<AppTasksScreen> createState() => _AppTasksScreenState();
}

class _AppTasksScreenState extends State<AppTasksScreen> {
  late final _bloc = BlocProvider.of<AppTaskBloc>(context);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppTaskBloc, AppTaskState>(
      bloc: _bloc,
      builder: (context, state) {
        final List<AppTask> tasks = [];

        if (state is AppTaskLoadedState) {
          tasks.addAll(state.tasks);
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Tasks'),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(tasks[index].title),
                subtitle: Text(tasks[index].description),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {},
                ),
              );
            },
          ),
        );
      },
    );
  }
}
