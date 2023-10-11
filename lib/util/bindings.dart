import 'package:get/get.dart';
import 'package:tastequest/viewmodels/auth_view_model.dart';
import 'package:tastequest/viewmodels/control_view_model.dart';
import 'package:tastequest/viewmodels/home_view_model.dart';
import 'package:tastequest/viewmodels/landing_page_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthViewModel>(() => AuthViewModel());
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());
    Get.lazyPut<ControlViewModel>(() => ControlViewModel());
    Get.lazyPut<LandingPageViewModel>(() => LandingPageViewModel());
  }
}
