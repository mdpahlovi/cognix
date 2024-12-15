import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final Color background = Theme.of(context).colorScheme.surface;
    return IconButton.outlined(
      onPressed: () => Get.back(),
      icon: Icon(HugeIcons.strokeRoundedArrowLeft01),
      padding: EdgeInsets.only(right: 2),
      style: ButtonStyle(backgroundColor: WidgetStateProperty.all(background)),
    );
  }
}
