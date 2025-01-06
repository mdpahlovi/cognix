import 'package:cognix/constants/features.dart';
import 'package:cognix/widgets/home/feature.dart';
import 'package:flutter/material.dart';

class AssistantsScreen extends StatefulWidget {
  const AssistantsScreen({super.key});

  @override
  State<AssistantsScreen> createState() => AssistantsScreenState();
}

class AssistantsScreenState extends State<AssistantsScreen> {
  String category = "All";

  @override
  Widget build(BuildContext context) {
    List<FeatureCategory> categoryList = categories(context);
    List<FeatureItem> featureList =
        categoryList.where((c) => category != "All" ? c.title == category : true).expand((category) => category.features).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length + 1,
              itemBuilder: (context, index) {
                String title = index == 0 ? 'All' : categoryList[index - 1].title;
                Color color = title == category ? Colors.black : Colors.white;
                Color backgroundColor = title == category ? Colors.white : Color(0xFF171717);

                return OutlinedButton(
                  onPressed: () => setState(() => category = title),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: backgroundColor,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: Text(title, style: TextStyle(color: color)),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 8),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemCount: (featureList.length / 2).ceil(),
              itemBuilder: (context, index) {
                int startIndex = index * 2;
                int endIndex = startIndex + 2;

                List<FeatureItem> rowItems = featureList.sublist(
                  startIndex,
                  endIndex > featureList.length ? featureList.length : endIndex,
                );

                return Row(
                  children: rowItems.asMap().entries.expand((entry) {
                    int idex = entry.key;
                    var item = entry.value;

                    return [
                      if (idex > 0) const SizedBox(width: 8),
                      Expanded(child: buildFeatureItem(item, false)),
                    ];
                  }).toList(),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 8),
            ),
          ),
        ],
      ),
    );
  }
}
