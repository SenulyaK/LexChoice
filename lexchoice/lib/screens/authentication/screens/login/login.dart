import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:lexchoice/common/styles/spacing_styles.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/constants/image_strings.dart';
import 'package:lexchoice/utils/constants/sizes.dart';
import 'package:lexchoice/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lexchoice/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = LCHelperFunctions.isDarkMode(context);

    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: LCSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            /// Logo, Title & Sub-Title
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Logo
                Image(
                  height: 150,
                  image: AssetImage(LCImages.appLogo),
                ),
                Text(LCTexts.loginTitle,
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(
                  height: LCSizes.sm,
                ),
                Text(LCTexts.loginSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),

            /// Login Form
            Form(
                child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: LCSizes.spaceBtwSections),
              child: Column(
                children: [
                  ///Email
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: LCTexts.email,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 12.0),
                    ),
                  ),
                  const SizedBox(
                    height: LCSizes.spaceBtwInputFields,
                  ),

                  ///Password
                  TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.password_check),
                        labelText: LCTexts.password,
                        suffixIcon: Icon(Iconsax.eye_slash),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 12.0)),
                  ),
                  const SizedBox(height: LCSizes.spaceBtwInputFields / 2),

                  ///Remember me and Forget Password
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Remember Me
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            const Text(LCTexts.rememberMe)
                          ],
                        ),

                        /// Forget Password
                        TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                foregroundColor:
                                    dark ? LCColors.light : LCColors.dark,
                                padding: EdgeInsets.zero,
                                minimumSize: Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero)),
                            child: const Text(LCTexts.forgetPassword))
                      ]),

                  const SizedBox(height: LCSizes.spaceBtwSections),

                  /// Sign In Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text(LCTexts.signIn))),
                  const SizedBox(height: LCSizes.spaceBtwItems),

                  /// Create Account Button
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Text(LCTexts.createAccount))),
                  const SizedBox(height: LCSizes.spaceBtwSections),
                ],
              ),
            )),

            /// Divider
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: Divider(
                        color: dark ? LCColors.darkerGrey : LCColors.grey,
                        thickness: 0.5,
                        indent: 60,
                        endIndent: 5)),
                Text(LCTexts.orSignInWith.capitalize!,
                    style: Theme.of(context).textTheme.labelMedium),
                Flexible(
                    child: Divider(
                        color: dark ? LCColors.darkerGrey : LCColors.grey,
                        thickness: 0.5,
                        indent: 5,
                        endIndent: 60)),
              ],
            ),

            const SizedBox(height: LCSizes.spaceBtwSections),

            /// Footer
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Google
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: LCColors.grey),
                      borderRadius: BorderRadius.circular(100)),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Image(
                      width: LCSizes.iconMd,
                      height: LCSizes.iconMd,
                      image: AssetImage(LCImages.google),
                    ),
                  ),
                ),
                const SizedBox(width: LCSizes.spaceBtwItems),

                /// Facebook
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: LCColors.grey),
                      borderRadius: BorderRadius.circular(100)),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Image(
                      width: LCSizes.iconMd,
                      height: LCSizes.iconMd,
                      image: AssetImage(LCImages.facebook),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
