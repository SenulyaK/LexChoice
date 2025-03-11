import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lexchoice/screens/authentication/screens/login/login.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index when page scroll
  void updatePageIndicator(int index) {
    currentPageIndex.value = index;  // Correctly update current page index
  }


  /// Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut, 
    );
  }

  /// Update current index & jump to the next page
  void nextPage() {
    if (currentPageIndex.value < 2) { // Ensuring it only goes forward if not on the last page
      currentPageIndex.value++; // Update the reactive state correctly
      pageController.animateToPage(
        currentPageIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
        Get.offAll(const LoginScreen()); // Navigate to the login screen
    }
  }


  /// Update current index & jump to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 500), // Controls animation speed
      curve: Curves.easeInOut, // Makes animation smooth
    );
  }
}