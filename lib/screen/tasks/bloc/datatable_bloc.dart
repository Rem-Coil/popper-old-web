import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popper/screen/tasks/bloc/dataTable_event.dart';
import 'package:popper/screen/tasks/bloc/dataTable_state.dart';
import 'package:popper/models/model.dart';
import 'package:popper/data/task_repository.dart';

class DataTableBloc extends Bloc<DataTableEvent, DataTableState> {
  // final TaskRepository tasksRepository = TaskRepository();

  List<TaskBobina> listOfBobinas = [
    TaskBobina(
      nameOfTask: "АЭ-113-4",
      numberOfTask: "23-09-21",
      numberOfBobinas: 60,
    ),
    TaskBobina(
        nameOfTask: "ДАЗ4-400-4",
        numberOfTask: "24-09-21",
        numberOfBobinas: 50),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
  ];

  DataTableBloc() : super(DataTableState.initial()) {
    on<ShowDataTable>((event, emit) async {
      // final newState = state.success(await taskList.getTasks());
      final newState = state.create(listOfBobinas);
      emit(newState);
    });
    on<CreateNewTask>(onCreateNewTask);
  }

  Future<void> onCreateNewTask(
      CreateNewTask event, Emitter<DataTableState> emit) async {
    TaskBobina newBobina = TaskBobina(
      nameOfTask: event.nameOfTask,
      numberOfTask: event.numberOfTask,
      numberOfBobinas: event.totalNumber,
    );
    final newState = state.addTask(newBobina);
    emit(newState);
  }
}
