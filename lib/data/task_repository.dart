import 'package:popper/data/service/service_provider.dart';
import 'package:popper/models/model.dart';
import 'package:popper/models/added_task.dart';

class TaskRepository {
  Future<List<TaskBobina>> getTasks() async {
    final service = ApiProvider().getApiService();
    final list = await service.getTable();
    print('List is gotten');
    return list;
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
