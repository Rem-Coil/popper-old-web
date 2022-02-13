import 'package:shared_preferences/shared_preferences.dart';

class ServerSettings {
  static const String _serverKey = 'serverUrl';

  static Future<ServerType> getServerType() async {
    final _prefs = await SharedPreferences.getInstance();
    final typeIndex = _prefs.getInt(_serverKey) ?? 0;
    final result = ServerType.values[typeIndex];
    return result;
  }

  static Future<void> changeServerType(ServerType serverType) async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.setInt(_serverKey, serverType.index);
  }
}

enum ServerType { LIVE, STAGE }

extension ServerTypeExtension on ServerType {
  String get url {
    switch (this) {
      case ServerType.LIVE:
        return 'https://prod.remcoil.space';
      case ServerType.STAGE:
        return 'https://popper-service.herokuapp.com';
    }
  }

  String get simpleName {
    switch (this) {
      case ServerType.LIVE:
        return 'LIVE';
      case ServerType.STAGE:
        return 'STAGE';
    }
  }
}
