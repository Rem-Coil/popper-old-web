import 'package:dio/dio.dart';
import 'package:popper/models/action.dart';
import 'package:popper/models/bobbin_information.dart';
import 'package:popper/models/model.dart';
import 'package:popper/models/added_task.dart';
import 'package:retrofit/retrofit.dart';

part 'service.g.dart';

@RestApi()
abstract class Service {
  factory Service(Dio dio, {String baseUrl}) = _Service;

  @GET('/task')
  Future<List<TaskBobina>> getTable();

  @POST('/task')
  Future<AddedTask> postTask(@Body() Map<String, dynamic> map);

  @GET('/action/{id}')
  Future<List<Action>> getActions(@Path("id") int id);

  @GET('/bobbin/{id}')
  Future<List<BobbinInformation>> getBobbinInformation(@Path("id") int id);
}
