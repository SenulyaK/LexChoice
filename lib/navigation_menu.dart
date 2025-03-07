import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:lexchoice/screens/home/home_screen.dart';
import 'package:lexchoice/screens/settings/settings_page.dart';
import 'package:lexchoice/screens/user_profile/user_profile_page.dart';
import 'package:lexchoice/screens/feedback_screen/feedback_screen.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = LCHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 65,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? LCColors.background : LCColors.darkGrey,
          indicatorColor: darkMode
              ? LCColors.white.withOpacity(0.1)
              : LCColors.white.withOpacity(0.1),
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.chart), label: 'Feedback'),
            NavigationDestination(
                icon: Icon(Iconsax.setting), label: 'Settings'),
            NavigationDestination(
                icon: Icon(Iconsax.user), label: 'Profile'), // Added Profile
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    FeedbackSelectionScreen(),
    SettingsPage(),
    UserProfilePage(),
  ];
}
