import 'package:cognix/constants/histories.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class Histories extends StatelessWidget {
  const Histories({super.key});

  @override
  Widget build(BuildContext context) {
    List<HistoryItem> historyList = histories(context);

    return ListView.separated(
      itemCount: historyList.length,
      itemBuilder: (context, index) => buildHistoryItem(historyList[index]),
      separatorBuilder: (context, index) => SizedBox(height: 8),
    );
  }
}

Widget buildHistoryItem(HistoryItem history) {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xFF171717),
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: Colors.white.withAlpha(25), width: 1),
    ),
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: history.color,
        child: Icon(history.icon, size: 20, color: Colors.black),
      ),
      title: Text(
        history.label,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 14),
      ),
      trailing: Icon(HugeIcons.strokeRoundedMoreVertical, color: Colors.white),
    ),
  );
}
