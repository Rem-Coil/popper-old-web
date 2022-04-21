import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:popper/core/network/server_settings.dart';
import 'package:popper/data/service/service.dart';

@singleton
class ApiProvider {
  final Dio _dio = Dio();

  Future<Service> getApiService() async {
    final currentServerType = await ServerSettings.getServerType();

    return Service(_dio, baseUrl: currentServerType.url);
  }

  void _logPrint(Object object) => log(object.toString());
}
