import 'package:cognix/screens/assistants.dart';
import 'package:cognix/screens/home.dart';
import 'package:cognix/screens/history.dart';
import 'package:cognix/screens/account.dart';
import 'package:cognix/widgets/global/NotificationButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeController extends GetxController {
  var tabIndex = 0.obs;

  void changeTabIndex(int index) => tabIndex.value = index;
}

class HomeLayout extends StatelessWidget {
  HomeLayout({super.key});

  final HomeController controller = Get.put(HomeController());
  final titles = ["", "Assistants", "History", "Account"];

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(titles[controller.tabIndex.value])),
        actions: [NotificationButton(), SizedBox(width: 8)],
      ),
      bottomNavigationBar: Obx(() => NavigationBar(
            onDestinationSelected: controller.changeTabIndex,
            indicatorColor: theme.primary,
            selectedIndex: controller.tabIndex.value,
            destinations: [
              NavigationItem(
                icon: HugeIcons.strokeRoundedHome09,
                label: 'Home',
              ),
              NavigationItem(
                icon: HugeIcons.strokeRoundedAiBrowser,
                label: 'Assistants',
              ),
              NavigationItem(
                icon: HugeIcons.strokeRoundedAiFolder01,
                label: 'History',
              ),
              NavigationItem(
                icon: HugeIcons.strokeRoundedUser,
                label: 'Account',
              ),
            ],
          )),
      body: Obx(() => [
            HomeScreen(),
            AssistantsScreen(),
            HistoryScreen(),
            AccountScreen()
          ][controller.tabIndex.value]),
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
