import 'package:flutter/material.dart';
import 'package:lexchoice/screens/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:lexchoice/utils/constants/image_strings.dart';
import 'package:lexchoice/utils/constants/sizes.dart';
import 'package:lexchoice/utils/constants/text_strings.dart';
import 'package:lexchoice/utils/devices/device_utility.dart';
import 'package:lexchoice/utils/helpers/helper_functions.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    final dark = LCHelperFunctions.isDarkMode(context);
    final screenWidth = LCHelperFunctions.screenWidth();
    final screenHeight = LCHelperFunctions.screenHeight();

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              // First Page
              Padding(
                padding: const EdgeInsets.all(LCSizes.defaultSpace),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Align items to top
                  children: [
                    const SizedBox(height: 10), // Adjust for fine-tuning
                    Expanded(
                      flex: 0, // More space for the animation
                      child: LottieBuilder.asset(
                        LCImages.onBoardingImage1,
                        width: screenWidth * 0.8,
                        height: screenHeight * 0.6,
                      ),
                    ),
                    Text(
                      // Title Text
                      LCTexts.onBoardingTitle1,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: LCSizes.spaceBtwItems),
                    Text(
                      // Subtitle Text
                      LCTexts.onBoardingSubTitle1,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // Second Page
              Padding(
                padding: const EdgeInsets.all(LCSizes.defaultSpace),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Expanded(
                      flex: 0,
                      child: LottieBuilder.asset(
                        LCImages
                            .onBoardingImage2, // New animation for second page
                        width: screenWidth * 0.8,
                        height: screenHeight * 0.6,
                      ),
                    ),
                    Text(
                      LCTexts.onBoardingTitle2, // New title for second page
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: LCSizes.spaceBtwItems),
                    Text(
                      LCTexts
                          .onBoardingSubTitle2, // New subtitle for second page
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // Third Page
              Padding(
                padding: const EdgeInsets.all(LCSizes.defaultSpace),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Expanded(
                      flex: 0,
                      child: LottieBuilder.asset(
                        LCImages
                            .onBoardingImage3, // New animation for third page
                        width: screenWidth * 0.8,
                        height: screenHeight * 0.6,
                      ),
                    ),
                    Text(
                      LCTexts.onBoardingTitle3, // New title for third page
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: LCSizes.spaceBtwItems),
                    Text(
                      LCTexts
                          .onBoardingSubTitle3, // New subtitle for third page
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),

          ///Skip Button
          Positioned(
              top: LCDeviceUtils.getAppBarHeight(),
              right: LCSizes.defaultSpace,
              child: TextButton(
                  onPressed: () {},
                  child: TextButton(
                    onPressed: () => OnboardingController.instance.skipPage(),
                    child: const Text("Skip"),
                  ))),

          ///Dot Navigation SmoothPageIndicator
          Positioned(
            bottom: LCDeviceUtils.getBottomNavigationBarHeight() + 25,
            left: LCSizes.defaultSpace + 10,
            child: SmoothPageIndicator(
              controller: controller.pageController,
              onDotClicked: controller.dotNavigationClick,
              count: 3,
              effect: ExpandingDotsEffect(
                  activeDotColor: dark ? LCColors.light : LCColors.dark,
                  dotHeight: 6),
            ),
          ),

          /// Circular Button
          Positioned(
              bottom: LCDeviceUtils.getBottomNavigationBarHeight() + 25,
              right: LCSizes.defaultSpace + 10,
              child: ElevatedButton(
                onPressed: () => OnboardingController.instance.nextPage(),
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: dark ? LCColors.primary : LCColors.black),
                child: Icon(
                  Iconsax.arrow_right_3,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.black // Dark mode icon color
                      : Colors.white, // Light mode icon color
                ),
              ))
        ],
      ),
    );
  }
}
