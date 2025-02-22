import 'package:flutter/material.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/constants/sizes.dart';
import 'package:lexchoice/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lexchoice/utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = LCHelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(LCSizes.defaultSpace),
          child: Column(
            
            children: [
            Text(LCTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: LCSizes.spaceBtwSections),

            /// Signup Form
            Form(
              child: Column(
                children: [
                  Row(
                    children: [
                      /// First Name
                      Expanded(
                        child: TextFormField(
                          expands: false,
                          decoration: const InputDecoration(
                              labelText: LCTexts.firstName,
                              prefixIcon: Icon(Iconsax.user)),
                        ),
                      ),
                      const SizedBox(width: LCSizes.spaceBtwInputFields),

                      /// Last Name
                      Expanded(
                        child: TextFormField(
                          expands: false,
                          decoration: const InputDecoration(
                              labelText: LCTexts.lastName,
                              prefixIcon: Icon(Iconsax.user)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: LCSizes.spaceBtwInputFields),

                  /// Username
                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: LCTexts.username,
                        prefixIcon: Icon(Iconsax.user_edit)),
                  ),

                  const SizedBox(height: LCSizes.spaceBtwInputFields),

                  /// Email
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: LCTexts.email,
                        prefixIcon: Icon(Iconsax.direct)),
                  ),

                  const SizedBox(height: LCSizes.spaceBtwInputFields),

                  /// Phone Number
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: LCTexts.phoneNo,
                        prefixIcon: Icon(Iconsax.call)),
                  ),
                  const SizedBox(height: LCSizes.spaceBtwInputFields),

                  /// Password
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        labelText: LCTexts.password,
                        prefixIcon: Icon(Iconsax.password_check),
                        suffixIcon: Icon(Iconsax.eye_slash)),
                  ),
                  const SizedBox(height: LCSizes.spaceBtwSections),

                  /// Terms and Conditions Checkbox
                  Row(
                    children: [
                      SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(value: true, onChanged: (value) {})),
                      const SizedBox(width: LCSizes.spaceBtwItems),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: '${LCTexts.iAgreeTo} ',
                            style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(
                            text: LCTexts.privacyPolicy,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(
                                    color: dark
                                        ? LCColors.light
                                        : LCColors.primary,
                                    decoration: TextDecoration.underline,
                                    decorationColor: dark
                                        ? LCColors.white
                                        : LCColors.primary)),
                        TextSpan(
                            text: ' ${LCTexts.and} ',
                            style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(
                            text: LCTexts.termsOfUse,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(
                                    color: dark
                                        ? LCColors.light
                                        : LCColors.primary,
                                    decoration: TextDecoration.underline,
                                    decorationColor: dark
                                        ? LCColors.white
                                        : LCColors.primary)),
                      ]))
                    ],
                  ),
                ],
              ),
            )
          ]),
        )));
  }
}
