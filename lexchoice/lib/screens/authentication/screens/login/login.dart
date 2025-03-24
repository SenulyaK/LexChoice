import 'package:flutter/material.dart';
import 'package:lexchoice/common/styles/spacing_styles.dart';
import 'package:lexchoice/navigation_menu.dart';
import 'package:lexchoice/screens/authentication/screens/password_configuration/forget_password.dart';
import 'package:lexchoice/screens/authentication/screens/signup/signup.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/constants/image_strings.dart';
import 'package:lexchoice/utils/constants/sizes.dart';
import 'package:lexchoice/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lexchoice/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:lexchoice/screens/authentication/screens/onboarding.dart';
import 'package:lexchoice/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool isLoading = false;
  bool rememberMe = false;
  bool obscurePassword = true;

  void _login() async {
    setState(() {
      isLoading = true;
    });

    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    String? token = await _authService.loginUser(email, password);

    setState(() {
      isLoading = false;
    });

    if (token != null) {
      // TODO: Store the token securely using `flutter_secure_storage`
      Get.offAll(() => const NavigationMenu());
    } else {
      Get.snackbar(
        "Login Failed",
        "Invalid email or password",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = LCHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
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
                        /// Email
                        TextFormField(
                          controller: emailController,
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

                        /// Password
                        TextFormField(
                          controller: passwordController,
                          obscureText: obscurePassword,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Iconsax.password_check),
                            labelText: LCTexts.password,
                            suffixIcon: IconButton(
                              icon: Icon(
                                obscurePassword
                                    ? Iconsax.eye_slash
                                    : Iconsax.eye,
                              ),
                              onPressed: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              },
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 12.0),
                          ),
                        ),
                        const SizedBox(height: LCSizes.spaceBtwInputFields / 2),

                        /// Remember Me and Forget Password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// Remember Me Button
                            Row(
                              children: [
                                Checkbox(
                                    value: rememberMe,
                                    onChanged: (value) {
                                      setState(() {
                                        rememberMe = value!;
                                      });
                                    }),
                                const Text(LCTexts.rememberMe),
                              ],
                            ),

                            /// Forget Password
                            TextButton(
                              onPressed: () =>
                                  Get.to(() => const ForgetPassword()),
                              style: TextButton.styleFrom(
                                foregroundColor:
                                    dark ? LCColors.light : LCColors.dark,
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(0, 0),
                                tapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                              ),
                              child: const Text(LCTexts.forgetPassword),
                            ),
                          ],
                        ),

                        const SizedBox(height: LCSizes.spaceBtwSections),

                        /// Sign In Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _login,
                            child: isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(LCTexts.signIn),
                          ),
                        ),
                        const SizedBox(height: LCSizes.spaceBtwItems),

                        /// Create Account Button
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () =>
                                Get.to(() => const SignupScreen()),
                            child: Text(LCTexts.createAccount),
                          ),
                        ),
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
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 40, // Adjust this value for positioning
            left: 10,
            child: IconButton(
              icon: const Icon(Iconsax.arrow_left, size: 24),
              onPressed: () => Get.to(() => const OnboardingScreen()),
              color: dark ? LCColors.light : LCColors.dark,
            ),
          ),
        ],
      ),
    );
  }
}
