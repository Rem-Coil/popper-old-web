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
      ShowTaskInformation event, Emitter<TaskInformationState> emit) async {
    emit(state.load());
    final bobbinInformation =
        await taskInformationRepository.getBobbinInformation(event.id);
    final firstState = bobbinInformation.fold<Future<TaskInformationState>>(
        (failure) async => state.error(failure.message), (bobbins) async {
      List<FinalInfo> finalList =
          bobbins.map((e) => FinalInfo.empty(e.bobbinNumber)).toList();
      //emit(state.showInfo(finalList));
      final actions = await taskInformationRepository.getActions(event.id);
      return actions.fold<TaskInformationState>(
          (failure) => state.error(failure.message), (actions) {
        actions.forEach((action) {
          final index = finalList
              .indexWhere((element) => element.taskName == action.bobbinNumber);
          finalList[index] = finalList[index].update(action);
        });
        return state.showInfo(finalList);
      });
    });
    emit(await firstState);
  }
}
