import 'package:cognix/constants/features.dart';
import 'package:cognix/controllers/bottom-navigation.dart';
import 'package:cognix/widgets/home/feature.dart';
import 'package:cognix/widgets/home/histories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final BottomNavigation controller = Get.put(BottomNavigation());

  @override
  Widget build(BuildContext context) {
    List<FeatureItem> featureList = features(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 6),
          Text(
            'How may I help\nyou today?',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 20),
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
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'History',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              TextButton(
                onPressed: () => controller.changeTabIndex(2),
                child: Text(
                  'See all',
                  style: TextStyle(color: Colors.white.withAlpha(128)),
                ),
              ),
            ],
          ),
          Expanded(child: Histories()),
        ],
      ),
    );
  }
}
