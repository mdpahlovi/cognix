import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class FeatureItem {
  Color color;
  IconData icon;
  String label;

  FeatureItem({required this.color, required this.icon, required this.label});
}

List<FeatureItem> features(BuildContext context) {
  return [
    FeatureItem(
      color: Theme.of(context).colorScheme.primary,
      icon: HugeIcons.strokeRoundedWechat,
      label: 'Talk\nwith Bot',
    ),
    FeatureItem(
      color: Theme.of(context).colorScheme.secondary,
      icon: HugeIcons.strokeRoundedVoice,
      label: 'Chat with Bot',
    ),
    FeatureItem(
      color: Theme.of(context).colorScheme.tertiary,
      icon: HugeIcons.strokeRoundedAiImage,
      label: 'Text to Image',
    ),
  ];
}
