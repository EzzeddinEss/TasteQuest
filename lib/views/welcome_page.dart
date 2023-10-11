import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tastequest/util/palette.dart';
import 'package:tastequest/viewmodels/auth_view_model.dart';
import 'package:tastequest/widgets/custom_elevated_button.dart';
import 'package:tastequest/widgets/custom_text_span.dart';

import '../widgets/background_image.dart';
import 'login_page.dart';
import 'registration_page.dart';

/// The welcome page widget displayed at the start of the application.
class WelcomePage extends GetWidget<AuthViewModel> {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.40,
                    child: Image.asset(
                      'assets/images/logo-clear.png',
                      width: 300,
                      height: 300,
                    )),
                const SizedBox(
                  height: 150,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Explore Culinary Adventures and Embark on a Flavorful Journey with TasteQuest",
                      style: TextStyle(fontSize: 1, color: Colors.white54),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    children: [
                      SocialCustomElevatedButton(
                        onPressed: () {
                          Get.to(() => const RegistrationPage(),
                              transition: Transition.leftToRightWithFade);
                        },
                        colour: kPrimaryColor,
                        kHeight: 50,
                        kwidth: 350,
                        kradius: 30,
                        text: 'Sign up with Email',
                        imagePath: 'assets/icons/email.png',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SocialCustomElevatedButton(
                        onPressed: () {
                          controller.googleSignInMethod();
                        },
                        colour: Colors.white,
                        kHeight: 50,
                        kwidth: 350,
                        kradius: 30,
                        textColor: Colors.black,
                        text: 'Sign up with Google',
                        imagePath: 'assets/icons/google.png',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: CustomTextSpan(
                    kText1: 'Already have an Account ? ',
                    kText2: 'Login',
                    kOnTap: () {
                      Get.to(() => LoginPage());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
