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
    double baseClass = 42; // we assigned an `int` to `num`, this is valid
    // UNSAFE! We assigned `num` to `double`. This is valid with `implicit-cast` only.
    // This will crash at runtime, as `baseClass` contains an `int` here.
    num concreteClass = baseClass;

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
