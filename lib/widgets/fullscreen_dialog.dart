import 'package:flutter/material.dart';

class FullScreenDialog extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget> actions;

  const FullScreenDialog({
    Key? key,
    required this.title,
    required this.body,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 2 * 16.0,
          top: 2 * 16.0,
          right: 2 * 16.0,
          bottom: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(child: body),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions,
            ),
          ],
        ),
      ),
    );
  }
}
