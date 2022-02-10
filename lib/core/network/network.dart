import 'package:popper/core/network/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkConfigRepository {
  static const HOST_KEY = 'host';

  static Future<NetworkConfig> loadConfig() async {
    final preferences = await SharedPreferences.getInstance();
    final host = preferences.getString(HOST_KEY);

    if (host == null) {
      return NetworkConfig.defaultConfig();
    } else {
      return NetworkConfig(host: host);
    }
  }

  static Future<void> updateConfig(String host) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString(HOST_KEY, host);
  }
}
