import 'package:cognix/constants/histories.dart';
import 'package:cognix/widgets/home/history.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<HistoryItem> historyList = histories(context);

    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: ListView.separated(
        itemCount: historyList.length,
        itemBuilder: (context, index) => buildHistoryItem(historyList[index]),
        separatorBuilder: (context, index) => SizedBox(height: 8),
      ),
    );
  }
}
