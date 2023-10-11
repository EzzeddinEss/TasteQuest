import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tastequest/viewmodels/auth_view_model.dart';
import 'package:tastequest/views/welcome_page.dart';
import 'package:tastequest/widgets/background_image.dart';
import 'package:tastequest/widgets/custom_elevated_button.dart';
import 'package:tastequest/widgets/custom_text_form_field.dart';
import 'package:tastequest/widgets/custom_text_span.dart';

/// The registration page widget that allows users to register a new account.
class RegistrationPage extends GetWidget<AuthViewModel> {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                              Get.offAll(() => const WelcomePage());
                            },
                            icon: const Icon(Icons.arrow_back_sharp),
                            color: Colors.white,
                          ),
                          const Text(
                            'Register New User',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomTextFormField(
                        onSave: (value) {
                          controller.name = value;
                        },
                        validate: (value) {
                          if (value == null) {
                            print(
                              "This field cannot be empty, please write your name.",
                            );
                          }
                        },
                        khintText: 'Please write your name',
                      ),
                      SizedBox(height: 20),
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
                        height: 320,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            CustomElevatedButton(
                              onPressed: () {
                                controller.createUserInWithEmailAndPassword();
                              },
                              text: 'Register',
                              kradius: 30,
                              kwidth: 350,
                            ),
                            const SizedBox(
                              height: 20,
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
        ),
      ],
    );
  }
}
