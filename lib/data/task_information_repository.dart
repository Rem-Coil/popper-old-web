import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:popper/core/di/injection.dart';
import 'package:popper/core/error/failure.dart';
import 'package:popper/data/service/api_provider.dart';
import 'package:popper/models/action.dart';
import 'package:popper/models/bobbin_information.dart';
import 'package:dartz/dartz.dart';

@singleton
class TaskInformationRepository {
  final ApiProvider _apiProvider = getIt<ApiProvider>();
  TaskInformationRepository();

  Future<Either<Failure, List<Action>>> getActions(int id) async {
    try {
      final service = await _apiProvider.getApiService();
      final list = await service.getActions(id);
      return Right(list);
    } on DioError catch (e) {
      switch (e.response?.statusCode) {
        case HttpStatus.internalServerError:
          return Left(ServerFailure());
      }
      return Left(UnknownFailure());
    }
  }

  Future<Either<Failure, List<BobbinInformation>>> getBobbinInformation(
    int id,
  ) async {
    try {
      final service = await _apiProvider.getApiService();
      final list = await service.getBobbinInformation(id);
      return Right(list);
    } on DioError catch (e) {
      switch (e.response?.statusCode) {
        case HttpStatus.internalServerError:
          return Left(ServerFailure());
      }
      return Left(UnknownFailure());
    }
  }
}
