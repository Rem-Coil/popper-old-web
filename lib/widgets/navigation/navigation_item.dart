import 'package:flutter/material.dart';
import 'package:popper/widgets/navigation/navigation_model.dart';

class NavigationItem extends StatelessWidget {
  final NavigationItemInfo item;
  final bool isSelected;

  const NavigationItem({
    Key? key,
    required this.item,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      decoration: isSelected ? _onSelectedDecoration() : null,
      child: ListTile(
        onTap: () {
          if (!isSelected) Navigator.of(context).pushNamed(item.route);
        },
        horizontalTitleGap: 0.0,
        leading: _getLeading(theme),
        title: _getTitle(theme),
      ),
    );
  }

  Widget _getLeading(ThemeData theme) {
    return Icon(
      item.icon,
      color: isSelected ? theme.primaryColor : Colors.grey[800],
      size: 20,
    );
  }

  Widget _getTitle(ThemeData theme) {
    return Text(
      item.title,
      style: TextStyle(
        color: isSelected ? theme.primaryColor : Colors.grey[800],
      ),
    );
  }

  Decoration _onSelectedDecoration() {
    return BoxDecoration(
      color: Colors.blue[50],
      border: Border(
        left: BorderSide(
          color: Colors.blue,
          width: 5,
        ),
      ),
    );
  }
}
