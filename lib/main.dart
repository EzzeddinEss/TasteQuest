import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tastequest/util/bindings.dart';
import 'package:tastequest/views/control_view.dart';
import 'package:tastequest/views/login_page.dart';
import 'package:tastequest/views/onboarding_screen.dart';
import 'package:tastequest/views/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const TasteQuestApp());
}

class TasteQuestApp extends StatelessWidget {
  const TasteQuestApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TasteQuest',
      theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white))),
      home: SplashScreen(),
      //const ControlView(),
      initialBinding: Binding(),
    );
  }
}
