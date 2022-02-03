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
  }

  Future<void> onGetTasks(
      ShowDataTable event, Emitter<DataTableState> emit) async {
    emit(state.load());
    final tasks = await tasksRepository.getTasks();
    final newState = tasks.fold(
        (failure) => state.error(failure.message),
        (tasks) => state
            .create(tasks..sort((TaskBobina a, TaskBobina b) => a.id - b.id)));
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
        (tasks) => state.create((tasks
              ..sort((TaskBobina a, TaskBobina b) => a.id - b.id))
            .where((element) => element.taskName
                .toLowerCase()
                .contains(event.filterWord.toLowerCase()))
            .toList()));
    emit(newState);
  }
}
