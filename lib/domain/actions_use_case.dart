import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:popper/core/error/failure.dart';
import 'package:popper/data/task_information_repository.dart';
import 'package:popper/models/action.dart';

@singleton
class DeleteDuplicateUseCase {
  final TaskInformationRepository taskInformationRepository;

  DeleteDuplicateUseCase(this.taskInformationRepository);

  Future<Either<Failure, List<Action>>> call(int bobbinId) async {
    Map<String, Action> numberAction = Map();
    try {
      final actionsList = await taskInformationRepository.getActions(bobbinId);
      return actionsList.fold((failure) => Left(failure), (actions) {
        actions.forEach((action) {
          String key = action.bobbinId.toString() + action.actionType;
          if (!numberAction.containsKey(key)) {
            numberAction[key] = action;
          } else {
            if (!numberAction[key]!.successful) {
              numberAction[key] = action;
            }
          }
        });
        return Right(numberAction.values.toList());
      });
    } on Error {
      return Left(UnknownFailure());
    }
  }
}
