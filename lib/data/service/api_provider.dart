import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:popper/core/network/server_settings.dart';
import 'package:popper/data/service/service.dart';

class ApiProvider {
  static ApiProvider? _instance;
  final Dio _dio = Dio();

  ApiProvider._();

  factory ApiProvider() {
    if (_instance == null) {
      _instance = ApiProvider._();
    }
    return _instance!;
  }

  Future<Service> getApiService() async {
    // _dio.interceptors.add(LogInterceptor(
    //   logPrint: _logPrint,
    //   request: true,
    //   requestHeader: true,
    //   responseBody: true,
    //   requestBody: true,
    //   responseHeader: true,
    // ));
    final currentServerType = await ServerSettings.getServerType();

    return Service(_dio, baseUrl: currentServerType.url);
  }

  void _logPrint(Object object) => log(object.toString());
}
