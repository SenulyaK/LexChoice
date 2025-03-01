import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lexchoice/utils/constants/sizes.dart';
import 'package:lexchoice/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:lexchoice/utils/constants/image_strings.dart';
import 'package:lexchoice/utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = LCHelperFunctions.screenWidth();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(LCSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              SizedBox(
                width: screenWidth * 0.8,
                child: LottieBuilder.asset(LCImages.emailSent),
              ),

              /// Title & Subtitle
              Text(LCTexts.changeYourPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),

              const SizedBox(height: LCSizes.spaceBtwItems),

              Text(LCTexts.changeYourPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),

              const SizedBox(
                height: LCSizes.spaceBtwSections,
              ),

              /// Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text(LCTexts.done))),
              const SizedBox(height: LCSizes.spaceBtwItems),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(LCTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
