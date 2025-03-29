import 'package:flutter/material.dart';
import 'package:lexchoice/screens/authentication/screens/signup/verify_email.dart';
import 'package:lexchoice/services/api_service.dart'; 
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/constants/sizes.dart';
import 'package:lexchoice/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lexchoice/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:lexchoice/utils/constants/image_strings.dart';

class SignupScreen extends StatefulWidget { 
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final ApiService _authService = ApiService(); 

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;
  bool isLoading = false; 

  void _signup() async { 
    setState(() => isLoading = true);

    final response = await _authService.registerUser(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      username: usernameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      password: passwordController.text.trim(),
    );

    setState(() => isLoading = false);

    if (response['message'] == 'User registered successfully!') {
      Get.to(() => VerifyEmailScreen());
    } else {
      Get.snackbar("Error", response['message'] ?? "Something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = LCHelperFunctions.isDarkMode(context);

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(LCSizes.defaultSpace),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            /// Signup Title
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
                          controller: firstNameController,
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
                          controller: lastNameController,
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
                    controller: usernameController,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: LCTexts.username,
                        prefixIcon: Icon(Iconsax.user_edit)),
                  ),

                  const SizedBox(height: LCSizes.spaceBtwInputFields),

                  /// Email
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        labelText: LCTexts.email,
                        prefixIcon: Icon(Iconsax.direct)),
                  ),

                  const SizedBox(height: LCSizes.spaceBtwInputFields),

                  /// Phone Number
                  TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                        labelText: LCTexts.phoneNo,
                        prefixIcon: Icon(Iconsax.call)),
                  ),
                  const SizedBox(height: LCSizes.spaceBtwInputFields),

                  /// Password
                  StatefulBuilder(
                    builder: (context, setState) {
                      return TextFormField(
                        controller: passwordController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          labelText: LCTexts.password,
                          prefixIcon: const Icon(Iconsax.password_check),
                          suffixIcon: IconButton(
                            icon: Icon(_obscureText
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: LCSizes.spaceBtwSections),

                  /// Terms and Conditions Checkbox
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(value: true, onChanged: (value) {}),
                      ),
                      const SizedBox(width: LCSizes.spaceBtwItems),
                      Expanded(
                        child: Text.rich(
                          TextSpan(children: [
                            TextSpan(
                              text: '${LCTexts.iAgreeTo} ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 12),
                            ),
                            TextSpan(
                              text: LCTexts.privacyPolicy,
                              style:
                                  Theme.of(context).textTheme.bodyMedium!.apply(
                                        color: dark
                                            ? LCColors.light
                                            : LCColors.primary,
                                        decoration: TextDecoration.underline,
                                      ),
                            ),
                            TextSpan(
                              text: ' ${LCTexts.and} ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 12),
                            ),
                            TextSpan(
                              text: LCTexts.termsOfUse,
                              style:
                                  Theme.of(context).textTheme.bodyMedium!.apply(
                                        color: dark
                                            ? LCColors.light
                                            : LCColors.primary,
                                        decoration: TextDecoration.underline,
                                      ),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: LCSizes.spaceBtwSections),

                  /// Signup button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _signup, 
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white) 
                          : const Text(LCTexts.createAccount),
                    ),
                  ),

                  const SizedBox(height: LCSizes.spaceBtwSections),

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
                      Text(LCTexts.orSignUpWith.capitalize!,
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

                  /// Social media login buttons
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
                    ],
                  )
                ],
              ),
            )
          ]),
        )));
  }
}
