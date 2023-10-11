import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tastequest/util/palette.dart';
import 'package:tastequest/viewmodels/auth_view_model.dart';
import 'package:tastequest/views/dashboard/home_page.dart';
import 'package:tastequest/views/welcome_page.dart';
import 'package:tastequest/widgets/background_image.dart';
import 'package:tastequest/widgets/custom_elevated_button.dart';
import 'package:tastequest/widgets/custom_text.dart';
import 'package:tastequest/widgets/custom_text_form_field.dart';
import 'package:tastequest/widgets/custom_text_span.dart';

/// The login page widget where users can log in to their accounts.
class LoginPage extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
        init: AuthViewModel(),
        builder: (controller) {
          return Stack(
            children: [
              const BackgroundDecoration(),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, top: 20),
                    child: SingleChildScrollView(
                      child: Form(
                        key: controller.formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Get.off(() => const WelcomePage());
                                    },
                                    icon: const Icon(Icons.arrow_back_sharp),
                                    color: Colors.white),
                                const Text(
                                  'Log In',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            CustomEmailTextFormField(
                              khintText: 'Your Email',
                              onSave: (value) {
                                controller.email = value!;
                              },
                              validate: (value) {
                                if (value != null) {
                                  return controller.validateEmail(value);
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomPasswordTextFormField(
                              khintText: 'Password',
                              onSave: (value) {
                                controller.password = value!;
                              },
                              validate: (value) {
                                if (value != null) {
                                  return controller.validatePassword(value);
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 15),
                              child: CustomTextSpan(
                                kOnTap: () {},
                                kText2: 'Forgot Password?',
                              ),
                            ),
                            const SizedBox(
                              height: 320,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                children: [
                                  CustomElevatedButton(
                                    onPressed: () {
                                      controller.signInWithEmailAndPassword();
                                    },
                                    text: 'Log In',
                                    kradius: 30,
                                    kwidth: 350,
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
                                    text: 'Log In with Google',
                                    imagePath: 'assets/icons/google.png',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }
}
