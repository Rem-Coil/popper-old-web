import 'dart:io';
import 'package:dio/dio.dart';
import 'package:popper/core/error/failure.dart';
import 'package:popper/data/service/service_provider.dart';
import 'package:popper/models/model.dart';
import 'package:popper/models/added_task.dart';
import 'package:dartz/dartz.dart';

class TaskRepository {
  Future<Either<Failure, List<TaskBobina>>> getTasks() async {
    try {
      final service = ApiProvider().getApiService();
      final list = await service.getTable();
      return Right(list);
    } on DioError catch (e) {
      switch (e.response?.statusCode) {
        case HttpStatus.internalServerError:
          return Left(ServerFailure());
        case HttpStatus.unauthorized:
          return Left(WrongCredentials());
      }
      return Left(UnknownFailure());
    }
  }

  Future<TaskBobina> addTask(AddedTask task) async {
    final service = ApiProvider().getApiService();
    final newTask = await service.postTask(task.toJson());
    print('task added');
    return TaskBobina(
        taskName: newTask.taskName,
        taskNumber: newTask.taskNumber,
        quantity: newTask.quantity);
  }
}
