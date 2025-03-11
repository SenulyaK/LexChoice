import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lexchoice/screens/authentication/screens/password_configuration/reset_password.dart';
import 'package:lexchoice/utils/constants/sizes.dart';
import 'package:lexchoice/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(LCSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(LCTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: LCSizes.spaceBtwItems),
            Text(LCTexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: LCSizes.spaceBtwSections * 2),

            /// Text Field
            TextFormField(
              decoration: const InputDecoration(
                  labelText: LCTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right)),
            ),

            const SizedBox(height: LCSizes.spaceBtwSections),

            /// Submit Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.off(() => const ResetPassword()),
                    child: const Text(LCTexts.submit))),
          ],
        ),
      ),
    );
  }
}
