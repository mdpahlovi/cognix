import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class FeatureItem {
  Color color;
  IconData icon;
  String label;
  String link;

  FeatureItem({
    required this.color,
    required this.icon,
    required this.label,
    required this.link,
  });
}

List<FeatureItem> features(BuildContext context) {
  return [
    FeatureItem(
      color: Theme.of(context).colorScheme.primary,
      icon: HugeIcons.strokeRoundedWechat,
      label: 'Chat with Bot',
      link: '/chat-bot',
    ),
    FeatureItem(
      color: Theme.of(context).colorScheme.secondary,
      icon: HugeIcons.strokeRoundedVoice,
      label: 'Talk with Bot',
      link: '/voice-assistant',
    ),
    FeatureItem(
      color: Theme.of(context).colorScheme.tertiary,
      icon: HugeIcons.strokeRoundedAiImage,
      label: 'Text to Image',
      link: '/image-generator',
    ),
  ];
}
