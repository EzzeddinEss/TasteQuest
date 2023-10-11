import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tastequest/util/palette.dart';
import 'package:tastequest/viewmodels/auth_view_model.dart';
import 'package:tastequest/viewmodels/control_view_model.dart';
import 'package:tastequest/views/dashboard/home_page.dart';
import 'package:tastequest/views/login_page.dart';
import 'package:tastequest/views/welcome_page.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginPage()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: _bottomNavigationBar(),
              ),
            );
    });
  }

  Widget _bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
        init: Get.find<ControlViewModel>(),
        builder: (controller) {
          return BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.favorite),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.search),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.person),
              ),
            ],
            currentIndex: controller.navigatorValue,
            onTap: (index) {
              controller.changeSelectedValue(index);
            },
            elevation: 1,
            selectedItemColor: kPrimaryColor,
            backgroundColor: Colors.grey.shade50,
            unselectedItemColor: Colors.black,
          );
        });
  }
}
