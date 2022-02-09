import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:popper/core/error/failure.dart';
import 'package:popper/data/service/service_provider.dart';
import 'package:popper/models/operator.dart';

class OperatorRepository {
  Future<Either<Failure, List<Operator>>> getOperators() async {
    try {
      final service = ApiProvider().getApiService();
      final list = await service.getOperators();
      return Right(list);
    } on DioError catch (e) {
      switch (e.response?.statusCode) {
        case HttpStatus.internalServerError:
          return Left(ServerFailure());
      }
      return Left(UnknownFailure());
    }
  }

  Future<Either<Failure, void>> deleteOperator(int id) async {
    try {
      final service = ApiProvider().getApiService();
      await service.deleteOperator(id);
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
