import 'package:dio/dio.dart';
import 'package:popper/models/action.dart';
import 'package:popper/models/bobbin_information.dart';
import 'package:popper/models/model.dart';
import 'package:popper/models/operator.dart';
import 'package:retrofit/retrofit.dart';

part 'service.g.dart';

@RestApi()
abstract class Service {
  factory Service(Dio dio, {String baseUrl}) = _Service;

  @GET('/task')
  Future<List<TaskBobina>> getTable();

  @POST('/task')
  Future<TaskBobina> postTask(@Body() Map<String, dynamic> map);

  @GET('/action/task/{id}')
  Future<List<Action>> getActions(@Path("id") int id);

  @GET('/bobbin/task/{id}')
  Future<List<BobbinInformation>> getBobbinInformation(@Path("id") int id);

  @GET('/operator')
  Future<List<Operator>> getOperators();

  @DELETE('/operator/{id}')
  Future<void> deleteOperator(@Path("id") int id);

  @DELETE('/task/{id}')
  Future<void> deleteTask(@Path("id") int id);
}
