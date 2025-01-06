import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class FeatureItem {
  final Color color;
  final IconData icon;
  final String label;
  final String link;

  FeatureItem({
    required this.color,
    required this.icon,
    required this.label,
    required this.link,
  });
}

class FeatureCategory {
  final String title;
  final List<FeatureItem> features;

  FeatureCategory({
    required this.title,
    required this.features,
  });
}

List<FeatureCategory> categories(BuildContext context) {
  return [
    FeatureCategory(
      title: 'Bot Interactions',
      features: [
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
      ],
    ),
    FeatureCategory(
      title: 'Productivity Tools',
      features: [
        FeatureItem(
          color: Theme.of(context).colorScheme.tertiary,
          icon: HugeIcons.strokeRoundedPdf01,
          label: 'PDF Scanner',
          link: '/pdf-scanner',
        ),
        FeatureItem(
          color: Theme.of(context).colorScheme.primary,
          icon: HugeIcons.strokeRoundedTextCreation,
          label: 'OCR (Text Recognition)',
          link: '/ocr-tool',
        ),
        FeatureItem(
          color: Theme.of(context).colorScheme.secondary,
          icon: HugeIcons.strokeRoundedTranslate,
          label: 'Document Translator',
          link: '/document-translator',
        ),
      ],
    ),
    FeatureCategory(
      title: 'AI Tools',
      features: [
        FeatureItem(
          color: Theme.of(context).colorScheme.tertiary,
          icon: HugeIcons.strokeRoundedAiImage,
          label: 'Text to Image',
          link: '/image-generator',
        ),
        FeatureItem(
          color: Theme.of(context).colorScheme.primary,
          icon: HugeIcons.strokeRoundedPaintBucket,
          label: 'AI Art Generator',
          link: '/ai-art',
        ),
        FeatureItem(
          color: Theme.of(context).colorScheme.secondary,
          icon: HugeIcons.strokeRoundedArtificialIntelligence03,
          label: 'AI Story Writer',
          link: '/story-writer',
        ),
      ],
    ),
    FeatureCategory(
      title: 'Utilities',
      features: [
        FeatureItem(
          color: Theme.of(context).colorScheme.tertiary,
          icon: HugeIcons.strokeRoundedCalculator,
          label: 'Advanced Calculator',
          link: '/calculator',
        ),
        FeatureItem(
          color: Theme.of(context).colorScheme.primary,
          icon: HugeIcons.strokeRoundedProfit,
          label: 'Weather Forecast',
          link: '/weather',
        ),
        FeatureItem(
          color: Theme.of(context).colorScheme.secondary,
          icon: HugeIcons.strokeRoundedMath,
          label: 'Unit Converter',
          link: '/unit-converter',
        ),
      ],
    ),
    FeatureCategory(
      title: 'Health & Fitness',
      features: [
        FeatureItem(
          color: Theme.of(context).colorScheme.tertiary,
          icon: HugeIcons.strokeRoundedWorkoutWarmUp,
          label: 'Workout Planner',
          link: '/workout-planner',
        ),
        FeatureItem(
          color: Theme.of(context).colorScheme.primary,
          icon: HugeIcons.strokeRoundedOrganicFood,
          label: 'Diet Recommendation',
          link: '/diet-planner',
        ),
        FeatureItem(
          color: Theme.of(context).colorScheme.secondary,
          icon: HugeIcons.strokeRoundedHealth,
          label: 'Health Tracker',
          link: '/health-tracker',
        ),
      ],
    ),
  ];
}
