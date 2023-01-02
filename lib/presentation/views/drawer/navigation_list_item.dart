import 'package:flutter/material.dart';

class NavigationListItem extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const NavigationListItem({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
