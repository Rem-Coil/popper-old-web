import 'package:flutter/material.dart';
import 'package:popper/core/network/config.dart';
import 'package:popper/core/network/network.dart';
import 'package:popper/core/network/server_settings.dart';

import '../../../constants.dart';

class NetworkSettings extends StatefulWidget {
  const NetworkSettings({Key? key}) : super(key: key);

  @override
  _NetworkSettingsState createState() => _NetworkSettingsState();
}

class _NetworkSettingsState extends State<NetworkSettings> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NetworkConfigRepository.loadConfig(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final config = snapshot.data as NetworkConfig;
          return _network(config.host);
        }
        return CircularProgressIndicator();
      },
    );
  }

  _network(String host) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Настройки подключения',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(height: defaultPadding),
        Row(
          children: [
            SettingField(title: 'Host:'),
          ],
        ),
      ],
    );
  }
}

class SettingField extends StatefulWidget {
  final String title;

  SettingField({Key? key, required this.title}) : super(key: key);

  @override
  _SettingFieldState createState() => _SettingFieldState();
}

class _SettingFieldState extends State<SettingField> {
  ServerType? dropdownValue;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      final currentServerType = await ServerSettings.getServerType();
      setState(() {
        dropdownValue = currentServerType;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.title),
        SizedBox(width: defaultPadding),
        DropdownButton(
          value: dropdownValue,
          onChanged: (ServerType? newVal) async {
            setState(() {
              dropdownValue = newVal!;
            });
            await ServerSettings.changeServerType(newVal!);
          },
          items: ServerType.values
              .map<DropdownMenuItem<ServerType>>((ServerType value) {
            return DropdownMenuItem<ServerType>(
              value: value,
              child: Text(value.simpleName),
            );
          }).toList(),
        )
      ],
    );
  }
}
