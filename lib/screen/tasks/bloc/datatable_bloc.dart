import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popper/models/model.dart';
import 'package:popper/screen/tasks/bloc/dataTable_event.dart';
import 'package:popper/screen/tasks/bloc/dataTable_state.dart';
import 'package:popper/models/added_task.dart';
import 'package:popper/data/task_repository.dart';

class DataTableBloc extends Bloc<DataTableEvent, DataTableState> {
  final TaskRepository tasksRepository = TaskRepository();

  DataTableBloc() : super(DataTableState.initial()) {
    on<ShowDataTable>(onGetTasks);
    on<CreateNewTask>(onCreateNewTask);
    on<UseFilter>(onUseFilter);
    on<DeleteTask>(onDeleteTask);
  }

  Future<void> onGetTasks(
      ShowDataTable event, Emitter<DataTableState> emit) async {
    emit(state.load());
    final tasks = await tasksRepository.getTasks();
    final newState = tasks.fold(
        (failure) => state.error(failure.message),
        (tasks) => state.updateTasks(
            tasks..sort((TaskBobina a, TaskBobina b) => a.id - b.id)));
    emit(newState);
  }

  Future<void> onCreateNewTask(
      CreateNewTask event, Emitter<DataTableState> emit) async {
    AddedTask addedTask = AddedTask(
      taskName: event.nameOfTask,
      taskNumber: event.numberOfTask,
      quantity: event.totalNumber,
    );
    final addedBobina = await tasksRepository.addTask(addedTask);
    final newState = state.addTask(addedBobina);
    emit(newState);
  }

  Future<void> onUseFilter(
      UseFilter event, Emitter<DataTableState> emit) async {
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

  Future<void> onDeleteTask(
      DeleteTask event, Emitter<DataTableState> emit) async {
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
