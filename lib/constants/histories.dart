import 'package:cognix/constants/features.dart';
import 'package:flutter/material.dart';

class HistoryItem {
  Color color;
  IconData icon;
  String label;

  HistoryItem({required this.color, required this.icon, required this.label});
}

List<HistoryItem> histories(BuildContext context) {
  List<FeatureItem> featureList = features(context);

  return [
    HistoryItem(
      color: featureList[0].color,
      icon: featureList[0].icon,
      label: 'Show me some color palettes for AI...',
    ),
    HistoryItem(
      color: featureList[1].color,
      icon: featureList[1].icon,
      label: 'I need some UI inspiration for dark...',
    ),
    HistoryItem(
      color: featureList[2].color,
      icon: featureList[2].icon,
      label: 'What are the best mobile apps 2023...',
    ),
    HistoryItem(
      color: featureList[0].color,
      icon: featureList[0].icon,
      label: 'Show me some color palettes for AI...',
    ),
    HistoryItem(
      color: featureList[1].color,
      icon: featureList[1].icon,
      label: 'I need some UI inspiration for dark...',
    ),
    HistoryItem(
      color: featureList[2].color,
      icon: featureList[2].icon,
      label: 'What are the best mobile apps 2023...',
    ),
  ];
}
