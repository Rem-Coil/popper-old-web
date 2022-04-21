import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:popper/core/error/failure.dart';
import 'package:popper/data/service/api_provider.dart';
import 'package:popper/models/model.dart';
import 'package:popper/models/added_task.dart';
import 'package:dartz/dartz.dart';

@singleton
class TaskRepository {
  final ApiProvider _apiProvider;

  TaskRepository(this._apiProvider);

  Future<Either<Failure, List<TaskBobina>>> getTasks() async {
    try {
      final service = await _apiProvider.getApiService();
      final list = await service.getTable();
      return Right(list);
    } on DioError catch (e) {
      switch (e.response?.statusCode) {
        case HttpStatus.internalServerError:
          return Left(ServerFailure());
      }
      return Left(UnknownFailure());
    }
  }

  Future<Either<Failure, TaskBobina>> addTask(AddedTask task) async {
    try {
      final service = await _apiProvider.getApiService();
      final addedTask = await service.addTask(task);
      return Right(addedTask);
    } on DioError catch (e) {
      switch (e.response?.statusCode) {
        case HttpStatus.internalServerError:
          return Left(ServerFailure());
      }
      return Left(UnknownFailure());
    }
  }

  Future<Either<Failure, void>> deleteTask(int id) async {
    try {
      final service = await _apiProvider.getApiService();
      await service.deleteTask(id);
      return Right(null);
    } on DioError catch (e) {
      switch (e.response?.statusCode) {
        case HttpStatus.internalServerError:
          return Left(ServerFailure());
      }
      return Left(UnknownFailure());
    }
  }
}
