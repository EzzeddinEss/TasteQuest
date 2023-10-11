import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tastequest/viewmodels/landing_page_view_model.dart';
import 'package:tastequest/views/control_view.dart';
import 'package:tastequest/widgets/custom_text.dart';

class SplashScreen extends GetView<LandingPageViewModel> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                image: AssetImage('assets/images/logo.png'), fit: BoxFit.fill)),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     const Icon(
        //       Icons.add_location_alt_outlined,
        //       color: Colors.white,
        //       size: 50,
        //     ),
        //     CustomText(
        //       text: '',
        //       alignment: Alignment.center,
        //       colour: Colors.white,
        //       fontSize: 80,
        //     )
        //   ],
        // ),
      ),
    );
  }
}
