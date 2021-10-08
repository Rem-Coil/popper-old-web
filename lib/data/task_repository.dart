import 'package:popper/data/service/service_provider.dart';
import 'package:popper/models/model.dart';

class TaskRepository {
  Future<List<TaskBobina>> getTasks() async {
    final service = ApiProvider().getApiService();
    final list = await service.getTable();
    print('List is gotten');
    return list;
  }
}
