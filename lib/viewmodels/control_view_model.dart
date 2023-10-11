import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tastequest/views/dashboard/favourites_view.dart';
import 'package:tastequest/views/dashboard/home_page.dart';
import 'package:tastequest/views/dashboard/search_view.dart';
import 'package:tastequest/views/dashboard/user_profile_view.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;
  Widget _currentScreen = HomeView();
  get currentScreen => _currentScreen;
  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentScreen = HomeView();
          break;
        }
      case 1:
        {
          _currentScreen = FavouritesView();
          break;
        }
      case 2:
        {
          _currentScreen = SearchView();
          break;
        }
      case 3:
        {
          _currentScreen = UserProfileView();
          break;
        }
    }
    update();
  }
}
