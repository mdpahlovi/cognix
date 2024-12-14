import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kajbari/functions/createRoute.dart';
import 'package:kajbari/screens/add-project.dart';
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
  final List<String> titles = ["", "Calendar", "", "Messages", "Profile"];

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final NavigatorState navigator = Navigator.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[selectedIndex]),
        actions: [
          IconButton.outlined(
            onPressed: () {},
            iconSize: 20,
            icon: Icon(HugeIcons.strokeRoundedNotification02),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(theme.surface),
            ),
          )
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) => setState(() => selectedIndex = index),
        indicatorColor: theme.primary,
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
              icon: Icon(HugeIcons.strokeRoundedAdd01),
              onPressed: () => navigator.push(createRoute(AddProject())),
            ),
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
      body: [
        HomeScreen(),
        CalendarScreen(),
        Placeholder(),
        MessagesScreen(),
        ProfileScreen()
      ][selectedIndex],
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
      icon: badge is String
          ? Badge(label: Text(badge!), child: Icon(icon))
          : Icon(icon),
      label: label,
    );
  }
}
