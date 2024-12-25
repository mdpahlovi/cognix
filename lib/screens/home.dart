import 'package:cognix/layouts/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final HomeController controller = Get.find<HomeController>();

    final List<Map<String, dynamic>> historyItems = [
      {
        'color': theme.primary,
        'icon': HugeIcons.strokeRoundedWechat,
        'label': 'Show me some color palettes for AI...',
      },
      {
        'color': theme.secondary,
        'icon': HugeIcons.strokeRoundedVoice,
        'label': 'I need some UI inspiration for dark...',
      },
      {
        'color': theme.tertiary,
        'icon': HugeIcons.strokeRoundedAiImage,
        'label': 'What are the best mobile apps 2023...',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How may I help\nyou today?',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: buildFeatureCart(
                  color: historyItems[0]['color'],
                  icon: historyItems[0]['icon'],
                  label: 'Talk\nwith Bot',
                  isLarge: true,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    buildFeatureCart(
                      color: historyItems[1]['color'],
                      icon: historyItems[1]['icon'],
                      label: 'Chat with Bot',
                      isLarge: false,
                    ),
                    SizedBox(height: 8),
                    buildFeatureCart(
                      color: historyItems[2]['color'],
                      icon: historyItems[2]['icon'],
                      label: 'Text to Image',
                      isLarge: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
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
          Expanded(
            child: ListView.separated(
              itemCount: historyItems.length,
              itemBuilder: (context, index) {
                return buildHistoryItem(
                  color: historyItems[index]['color'],
                  icon: historyItems[index]['icon'],
                  label: historyItems[index]['label'],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 8);
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildFeatureCart({
  required IconData icon,
  required Color color,
  required String label,
  required bool isLarge,
}) {
  return InkWell(
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(50),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.black),
              ),
              Icon(Icons.arrow_outward, color: Colors.black)
            ],
          ),
          SizedBox(height: isLarge ? 48 : 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: isLarge ? 32 : 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildHistoryItem({
  required IconData icon,
  required Color color,
  required String label,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xFF171717),
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: Colors.white.withAlpha(25), width: 1),
    ),
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Icon(icon, size: 20, color: Colors.black),
      ),
      title: Text(
        label,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 14),
      ),
      trailing: Icon(HugeIcons.strokeRoundedMoreVertical, color: Colors.white),
    ),
  );
}
