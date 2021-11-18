import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popper/data/task_information_repository.dart';
import 'package:popper/models/final_info.dart';
import 'package:popper/screen/tasks/bloc/task_information_event.dart';
import 'package:popper/screen/tasks/bloc/task_information_state.dart';

class TaskInformationBloc
    extends Bloc<TaskInformationEvent, TaskInformationState> {
  final TaskInformationRepository taskInformationRepository =
      TaskInformationRepository();

  TaskInformationBloc() : super(TaskInformationState.initial()) {
    on<ShowTaskInformation>(onShowTaskInformationEvent);
  }

  Future<void> onShowTaskInformationEvent(
    ShowTaskInformation event,
    Emitter<TaskInformationState> emit,
  ) async {
    emit(state.load());
    final bobbins =
        await taskInformationRepository.getBobbinInformation(event.id);
    final actions = await taskInformationRepository.getActions(event.id);

    final firstState = bobbins
        .map((b) => b.map((e) => FinalInfo.empty(e.bobbinNumber)).toList())
        .fold<Future<TaskInformationState>>(
      (failure) async => state.error(failure.message),
      (bobbins) async {
        return actions.fold<TaskInformationState>(
          (failure) => state.error(failure.message),
          (actions) {
            actions.forEach((action) {
              final index = bobbins.indexWhere(
                  (element) => element.taskName == action.bobbinNumber);
              bobbins[index] = bobbins[index].update(action);
            });
            return state.showInfo(bobbins);
          },
        );
      },
    );
    emit(await firstState);
  }
}
