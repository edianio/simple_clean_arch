import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_clean_arch/src/domain/task/use_cases/add_task.dart';
import 'package:simple_clean_arch/src/domain/task/use_cases/delete_task.dart';
import 'package:simple_clean_arch/src/domain/task/use_cases/get_tasks.dart';
import 'package:simple_clean_arch/src/domain/task/use_cases/update_task.dart';
import 'package:simple_clean_arch/src/presentation/screens/task/bloc/app_task_event.dart';
import 'package:simple_clean_arch/src/presentation/screens/task/bloc/app_task_state.dart';

class AppTaskBloc extends Bloc<AppTaskEvent, AppTaskState> {
  final AddTask _addTask;
  final GetTasks _getTasks;
  final DeleteTask _deleteTask;
  final UpdateTask _updateTask;

  AppTaskBloc(this._addTask, this._getTasks, this._deleteTask, this._updateTask,) : super(AppTaskLoadingState()){
    on<AddTaskEvent>(_add);
    on<GetTasksEvent>(_get);
    on<DeleteTaskEvent>(_delete);
    on<UpdateTaskEvent>(_update);
  }

  Future<void> _get(GetTasksEvent event, Emitter emit) async {
    emit(AppTaskLoadingState());
    try{
      final tasks = await _getTasks();
      emit(AppTaskLoadedState(tasks));
    }catch(e) {
      emit(AppTaskErrorState(e.toString()));
    }
  }

  Future<void> _add(AddTaskEvent event, Emitter emit) async {
    try{
      await _addTask(event.task);
    }catch(e){
      emit(AppTaskErrorState(e.toString()));
    }
    add(GetTasksEvent());
  }

  Future<void> _delete(DeleteTaskEvent event, Emitter emit) async {
    try{
      await _deleteTask(event.id);
    }catch(e){
      emit(AppTaskErrorState(e.toString()));
    }
    add(GetTasksEvent());
  }

  Future<void> _update(UpdateTaskEvent event, Emitter emit) async {
    try{
      await _updateTask(event.task);
    }catch(e){
      emit(AppTaskErrorState(e.toString()));
    }
    add(GetTasksEvent());
  }
}