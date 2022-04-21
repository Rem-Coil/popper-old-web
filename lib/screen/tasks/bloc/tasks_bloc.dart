import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:popper/models/model.dart';
import 'package:popper/screen/tasks/bloc/tasks_event.dart';
import 'package:popper/screen/tasks/bloc/tasks_state.dart';
import 'package:popper/models/added_task.dart';
import 'package:popper/data/task_repository.dart';

@singleton
class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final TaskRepository tasksRepository;

  TasksBloc(this.tasksRepository) : super(TasksState.initial()) {
    on<GetTasks>(onGetTasks);
    on<CreateTask>(onCreateTask);
    on<UseFilter>(onUseFilter);
    on<DeleteTask>(onDeleteTask);
  }

  Future<void> onGetTasks(GetTasks event, Emitter<TasksState> emit) async {
    emit(state.load());
    final tasks = await tasksRepository.getTasks();
    final newState = tasks.fold(
        (failure) => state.error(failure.message),
        (tasks) => state.updateTasks(
            tasks..sort((TaskBobina a, TaskBobina b) => a.id - b.id)));
    emit(newState);
  }

  Future<void> onCreateTask(CreateTask event, Emitter<TasksState> emit) async {
    AddedTask addedTask = AddedTask(
      taskName: event.nameOfTask,
      taskNumber: event.numberOfTask,
      quantity: event.totalNumber,
    );
    final addedBobina = await tasksRepository.addTask(addedTask);
    final newState = addedBobina.fold(
      (failure) => state.error(failure.message),
      (addedBobbin) {
        List<TaskBobina> list = List.from(state.listBobinas);
        list.add(addedBobbin);
        return state.updateTasks(list);
      },
    );
    emit(newState);
  }

  Future<void> onUseFilter(UseFilter event, Emitter<TasksState> emit) async {
    emit(state.load());
    final tasks = await tasksRepository.getTasks();
    final newState = tasks.fold(
        (failure) => state.error(failure.message),
        (tasks) => state.updateTasks((tasks
              ..sort((TaskBobina a, TaskBobina b) => a.id - b.id))
            .where((element) => element.taskName
                .toLowerCase()
                .contains(event.filterWord.toLowerCase()))
            .toList()));
    emit(newState);
  }

  Future<void> onDeleteTask(DeleteTask event, Emitter<TasksState> emit) async {
    emit(state.load());
    final deletingTask = await tasksRepository.deleteTask(event.id);
    final newState = deletingTask.fold(
      (failure) => state.error(failure.message),
      (_) {
        List<TaskBobina> list = List.from(state.listBobinas);
        list.removeWhere((element) => element.id == event.id);
        return state.updateTasks(list);
      },
    );
    emit(newState);
  }
}
