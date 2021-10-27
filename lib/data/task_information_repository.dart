import 'package:popper/data/service/service_provider.dart';
import 'package:popper/models/action.dart';
import 'package:popper/models/bobin_information.dart';
import 'package:popper/models/model.dart';

class TaskInformationRepository {
  Future<List<Action>> getActions(String id) async {
    final service = ApiProvider().getApiService();
    final list = await service.getActions(id);
    return list;
  }

  Future<List<BobbinInformation>> getBobbinInformation(String id) async {
    final service = ApiProvider().getApiService();
    final list = await service.getBobbinInformation(id);
    return list;
  }
}
