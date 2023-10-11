import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tastequest/views/login_page.dart';
import 'package:tastequest/views/welcome_page.dart';
import 'package:tastequest/widgets/custom_elevated_button.dart';
import 'package:tastequest/widgets/custom_text.dart';

class UserProfileView extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              child: CustomElevatedButton(
        onPressed: () {
          _auth.signOut();
          GoogleSignIn().signOut();
          Get.offAll(() => WelcomePage());
        },
        text: 'Logout',
      ))),
    );
  }
}
