import 'package:cognix/constants/features.dart';
import 'package:cognix/constants/histories.dart';
import 'package:cognix/controllers/bottom_navigation.dart';
import 'package:cognix/widgets/home/feature.dart';
import 'package:cognix/widgets/home/history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final BottomNavigationController controller = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    List<FeatureCategory> categoryList = categories(context);
    List<HistoryItem> historyList = histories(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 6),
            Text(
              'How may I help\nyou today?',
              style: TextStyle(height: 1.25, fontSize: 32, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: buildFeatureItem(categoryList[0].features[0], true)),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    children: [
                      buildFeatureItem(categoryList[0].features[1], false),
                      SizedBox(height: 8),
                      buildFeatureItem(categoryList[1].features[0], false),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('History', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                TextButton(
                  onPressed: () => controller.changeTabIndex(2),
                  child: Text('See all', style: TextStyle(color: Colors.white.withAlpha(128))),
                ),
              ],
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) => buildHistoryItem(historyList[index]),
              separatorBuilder: (context, index) => SizedBox(height: 8),
            )
          ],
        ),
      ),
    );
  }
}
