import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lexchoice/screens/authentication/screens/login/login.dart';
import 'package:lottie/lottie.dart';
import 'package:lexchoice/utils/constants/sizes.dart';
import 'package:lexchoice/utils/constants/text_strings.dart';
import 'package:lexchoice/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:lexchoice/utils/constants/image_strings.dart';
import 'package:lexchoice/common/success_screen/success_screen.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = LCHelperFunctions.screenWidth();
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => Get.offAll(() => const LoginScreen()),
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
                  width: screenWidth * 0.9,
                  child: LottieBuilder.asset(LCImages.emailSent),
                ),

                /// Title & Subtitle
                Text(LCTexts.confirmEmail,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: LCSizes.spaceBtwItems),
                Text('email',
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.center),
                const SizedBox(height: LCSizes.spaceBtwItems),
                Text(LCTexts.confirmEmailSubTitle,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center),

                const SizedBox(height: LCSizes.spaceBtwSections),

                /// Buttons
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => Get.to(() => const SuccessScreen()),
                        child: Text(LCTexts.lcContinue))),
                const SizedBox(height: LCSizes.spaceBtwItems),
                SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {}, child: Text(LCTexts.resendEmail))),
              ],
            ),
          ),
        ));
  }
}
