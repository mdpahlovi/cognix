import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kajbari/screens/calendar.dart';
import 'package:kajbari/screens/home.dart';
import 'package:kajbari/screens/messages.dart';
import 'package:kajbari/screens/profile.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        indicatorColor: theme.primaryColor,
        selectedIndex: selectedIndex,
        destinations: [
          NavigationItem(
            icon: HugeIcons.strokeRoundedHome09,
            label: 'Home',
          ),
          NavigationItem(
            icon: HugeIcons.strokeRoundedCalendar03,
            label: 'Calendar',
          ),
          Center(
            child: IconButton.filled(
                onPressed: () {}, icon: Icon(HugeIcons.strokeRoundedAdd01)),
          ),
          NavigationItem(
            icon: HugeIcons.strokeRoundedMail01,
            label: 'Messages',
            badge: "2",
          ),
          NavigationItem(
            icon: HugeIcons.strokeRoundedUser,
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(
          child: [
        HomeScreen(),
        CalendarScreen(),
        Placeholder(),
        MessagesScreen(),
        ProfileScreen()
      ][selectedIndex]),
    );
  }
}

class NavigationItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? badge;

  const NavigationItem({
    super.key,
    required this.icon,
    required this.label,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      selectedIcon: badge is String
          ? Badge(label: Text(badge!), child: Icon(icon, color: Colors.white))
          : Icon(icon, color: Colors.white),
      icon: badge is String
          ? Badge(label: Text(badge!), child: Icon(icon))
          : Icon(icon),
      label: label,
    );
  }
}
