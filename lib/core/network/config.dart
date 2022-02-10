import 'package:flutter/foundation.dart';

@immutable
class NetworkConfig {
  static const DEFAULT_HOST = 'localhost';

  final String host;

  const NetworkConfig({
    required this.host,
  });

  factory NetworkConfig.defaultConfig() => NetworkConfig(
        host: DEFAULT_HOST,
      );
}
