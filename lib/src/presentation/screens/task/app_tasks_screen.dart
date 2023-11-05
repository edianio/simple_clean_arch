import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_clean_arch/src/domain/task/entities/app_task.dart';
import 'package:simple_clean_arch/src/presentation/screens/task/bloc/app_task_bloc.dart';
import 'package:simple_clean_arch/src/presentation/screens/task/bloc/app_task_event.dart';
import 'package:simple_clean_arch/src/presentation/screens/task/bloc/app_task_state.dart';
import 'package:simple_clean_arch/src/presentation/screens/validation/validators.dart';
import 'package:simple_clean_arch/src/utils/nullable.dart';

class AppTasksScreen extends StatefulWidget {
  const AppTasksScreen({super.key});

  @override
  State<AppTasksScreen> createState() => _AppTasksScreenState();
}

class _AppTasksScreenState extends State<AppTasksScreen> {
  late final _bloc = BlocProvider.of<AppTaskBloc>(context);
  AppTask newTask = AppTask.empty();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _showForm(BuildContext context) => showAdaptiveDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                    validator: (value) => Validators().emptyOrNull(value),
                    onSaved: (value) => newTask = newTask.copyWith(title: value),
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                    ),
                    validator: (value) => Validators().emptyOrNull(value),
                    onSaved: (value) => newTask = newTask.copyWith(description: value),
                  ),
                  FilledButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _bloc.add(AddTaskEvent(newTask));
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Save'),
                  ),
                  FilledButton(
                    onPressed: () {
                      newTask = AppTask.empty();
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showForm(context),
          ),
        ],
      ),
      body: BlocBuilder<AppTaskBloc, AppTaskState>(
        builder: (context, state) {
          final List<AppTask> tasks = [];

          if (state is AppTaskLoadedState) {
            tasks.addAll(state.tasks);
          }

          return RefreshIndicator(
            onRefresh: () async => _bloc.add(GetTasksEvent()),
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final bool completed = tasks[index].completedAt == null ? false : true;
                return Dismissible(
                  key: Key(tasks[index].id.toString()),
                  onDismissed: (direction) => _bloc.add(DeleteTaskEvent(tasks[index].id!)),
                  background: Container(
                    color: Colors.red,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if(completed){
                        _bloc.add(UpdateTaskEvent(tasks[index].copyWith(completedAt: const Nullable(null))));
                      }else{
                        _bloc.add(UpdateTaskEvent(tasks[index].copyWith(completedAt: Nullable(DateTime.now()))));
                      }
                    },
                    child: ListTile(
                      title: Text(
                        tasks[index].title,
                        style: TextStyle(
                          decoration: completed ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      subtitle: Text(
                        tasks[index].description,
                        style: TextStyle(
                          decoration: completed ? TextDecoration.lineThrough : null,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
