import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    final List<Map<String, dynamic>> historyItems = [
      {
        'color': theme.primary,
        'icon': HugeIcons.strokeRoundedVoice,
        'label': 'I need some UI inspiration for dark...',
      },
      {
        'color': theme.secondary,
        'icon': HugeIcons.strokeRoundedWechat,
        'label': 'Show me some color palettes for AI...',
      },
      {
        'color': theme.tertiary,
        'icon': HugeIcons.strokeRoundedAiImage,
        'label': 'What are the best mobile apps 2023...',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Greeting
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'How may I help\nyou today?',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(height: 20),
        // Action Cards
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildActionCard(
              color: historyItems[0]['color'],
              icon: historyItems[0]['icon'],
              label: 'Talk with Bot',
            ),
            SizedBox(width: 8),
            _buildActionCard(
              color: historyItems[1]['color'],
              icon: historyItems[1]['icon'],
              label: 'Chat with Bot',
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildActionCard(
              color: historyItems[2]['color'],
              icon: historyItems[2]['icon'],
              label: 'Search by Image',
            ),
          ],
        ),
        SizedBox(height: 20),
        // History Section
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'History',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(
                'See all',
                style: TextStyle(color: Colors.white.withAlpha(128)),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView.separated(
              itemCount: historyItems.length,
              itemBuilder: (context, index) {
                final item = historyItems[index];
                return HistoryItem(
                  color: item['color'],
                  icon: item['icon'],
                  label: item['label'],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 8);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class HistoryItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const HistoryItem({
    super.key,
    required this.icon,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
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
        trailing:
            Icon(HugeIcons.strokeRoundedMoreVertical, color: Colors.white),
      ),
    );
  }
}

Widget _buildActionCard(
    {required Color color, required IconData icon, required String label}) {
  return Expanded(
    child: Container(
      height: 120,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: Colors.black, size: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.arrow_outward, color: Colors.black),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
