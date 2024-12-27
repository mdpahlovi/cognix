import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Color background = Theme.of(context).colorScheme.surface;
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withAlpha(25), width: 1),
      ),
      child: Center(child: child),
    );
  }
}
