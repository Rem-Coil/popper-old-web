import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popper/dataTable_event.dart';
import 'package:popper/dataTable_state.dart';
import 'package:popper/model.dart';

class DataTableBloc extends Bloc<DataTableEvent, DataTableState> {
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
    on<ShowDataTable>((event, emit) {
      final newState = state.success(listOfBobinas);
      emit(newState);
    });
  }
}
