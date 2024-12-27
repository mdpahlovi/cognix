import 'package:cognix/constants/features.dart';
import 'package:cognix/widgets/home/feature.dart';
import 'package:flutter/material.dart';

class AssistantsScreen extends StatelessWidget {
  const AssistantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<FeatureItem> featureList = features(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: buildFeatureItem(featureList[0], true)),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  children: [
                    buildFeatureItem(featureList[1], false),
                    SizedBox(height: 8),
                    buildFeatureItem(featureList[2], false),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
