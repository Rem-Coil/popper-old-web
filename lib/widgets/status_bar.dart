import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
  static const onEmptyBobbinsText = 'Список пуст';
  final bool hasError;
  final bool isLoad;
  final bool hasElements;
  final String? error;

  const StatusBar({
    Key? key,
    required this.error,
    required this.hasElements,
    required this.hasError,
    required this.isLoad,
  })  : assert(!hasError || error != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Column(
        children: [
          SizedBox(
            height: 16,
            child: _getText(),
          ),
          SizedBox(
            height: 4,
            child: isLoad
                ? LinearProgressIndicator(backgroundColor: Colors.white)
                : null,
          )
        ],
      ),
    );
  }

  Widget _getText() {
    if (isLoad) return Container();
    if (hasError) return Text(error!);
    if (!hasElements) return Text(onEmptyBobbinsText);
    return Container();
  }
}
