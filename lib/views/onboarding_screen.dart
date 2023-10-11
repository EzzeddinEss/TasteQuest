import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tastequest/viewmodels/landing_page_view_model.dart';
import 'package:tastequest/views/control_view.dart';
import 'package:tastequest/widgets/custom_text.dart';

/// The splash screen widget that is displayed when the app starts.
class SplashScreen extends GetView<LandingPageViewModel> {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    // Delay the navigation to the ControlView after 5 seconds
    Future.delayed(
      const Duration(seconds: 5),
      () => Get.offAll(() => ControlView(),
          transition: Transition.fadeIn, duration: const Duration(seconds: 1)),
    );

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logo.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
