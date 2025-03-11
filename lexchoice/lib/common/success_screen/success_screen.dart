import 'package:flutter/material.dart';
import 'package:lexchoice/common/styles/spacing_styles.dart';
import 'package:lexchoice/screens/authentication/screens/login/login.dart';
import 'package:lexchoice/utils/constants/sizes.dart';
import 'package:lexchoice/utils/constants/text_strings.dart';
import 'package:lexchoice/utils/helpers/helper_functions.dart';
import 'package:lottie/lottie.dart';
import 'package:lexchoice/utils/constants/image_strings.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = LCHelperFunctions.screenWidth();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: LCSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /// Image
              SizedBox(
                width: screenWidth * 1.9,
                child: LottieBuilder.asset(LCImages.emailVerified),
              ),

              /// Title & Subtitle
              Text(LCTexts.yourAccountCreatedTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),

              const SizedBox(height: LCSizes.spaceBtwItems),

              Text(LCTexts.yourAccountCreatedSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),

              const SizedBox(
                height: LCSizes.spaceBtwSections,
              ),

              /// Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => const LoginScreen()),
                      child: const Text(LCTexts.lcContinue))),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
