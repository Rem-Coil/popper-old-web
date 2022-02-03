import 'package:flutter/material.dart';
import 'package:popper/models/navigation_model.dart';
import 'package:popper/widgets/navigation_item.dart';
import 'navigation_logo_item.dart';

class NavigationList extends StatelessWidget {
  final List<NavigationItemInfo> navigationItems;
  final int selectedItem;

  const NavigationList({
    Key? key,
    required this.navigationItems,
    required this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: navigationItems.length + 1,
        itemBuilder: (context, index) {
          if (index == 0)
            return NavigationLogoItem();
          else
            return NavigationItem(
              item: navigationItems[index - 1],
              isSelected: index == selectedItem,
            );
        },
      ),
    );
  }
}
