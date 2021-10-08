import 'package:dio/dio.dart';
import 'package:popper/models/model.dart';
import 'package:retrofit/retrofit.dart';

part 'service.g.dart';

@RestApi()
abstract class Service {
  factory Service(Dio dio, {String baseUrl}) = _Service;

  @GET('/task')
  Future<List<TaskBobina>> getTable();
}
