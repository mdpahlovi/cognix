import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kajbari/screens/calendar.dart';
import 'package:kajbari/screens/home.dart';
import 'package:kajbari/screens/messages.dart';
import 'package:kajbari/screens/profile.dart';
import 'package:kajbari/widgets/global/NotificationButton.dart';

class HomeController extends GetxController {
  var index = 0.obs;
}

class HomeLayout extends StatelessWidget {
  HomeLayout({super.key});

  final HomeController controller = Get.put(HomeController());
  final titles = ["", "Calendar", "", "Messages", "Profile"];

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(titles[controller.index.value])),
        actions: [NotificationButton()],
      ),
      bottomNavigationBar: Obx(() => NavigationBar(
            onDestinationSelected: (index) => controller.index.value = index,
            indicatorColor: theme.primary,
            selectedIndex: controller.index.value,
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
                  onPressed: () => Get.toNamed("/add-project"),
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
          )),
      body: Obx(() => [
            HomeScreen(),
            CalendarScreen(),
            Placeholder(),
            MessagesScreen(),
            ProfileScreen()
          ][controller.index.value]),
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
