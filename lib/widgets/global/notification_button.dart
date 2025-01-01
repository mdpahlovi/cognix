import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    final Color background = Theme.of(context).colorScheme.surface;
    return IconButton.outlined(
      onPressed: () {},
      iconSize: 20,
      icon: Icon(HugeIcons.strokeRoundedNotification02),
      style: ButtonStyle(backgroundColor: WidgetStateProperty.all(background)),
    );
  }
}
