import 'package:flutter/material.dart';

import 'navigation_list_item.dart';

class NavigationExpandedListItem extends StatelessWidget {
  final String title;
  final List children;
  final Function(int i) onPressed;

  const NavigationExpandedListItem({
    super.key,
    required this.title,
    required this.children,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      children: [
        for (int i = 0; i < children.length; i++)
          NavigationListItem(
            title: children[i],
            onPressed: () => onPressed(i),
          )
      ],
    );
  }
}
