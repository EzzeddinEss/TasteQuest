import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tastequest/models/categrory_model.dart';
import 'package:tastequest/models/recipe_api.dart';
import 'package:tastequest/models/recipe_model.dart';
import 'package:tastequest/services/home_services.dart';

/// View model for the home screen.
class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

  List<RecipeModel> get recipeModel => _recipeModel;
  List<RecipeModel> _recipeModel = [];

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  HomeViewModel() {
    getCategory();
  }

  /// Fetches recipes from the API.
  ///
  Future<void> getRecipes() async {
    _loading.value = true;
    try {
      _recipeModel = await RecipeApi.getRecipe();
    } catch (error) {
      // Handle the error using GetX's error handling
      Get.snackbar(
        'Error',
        'Failed to fetch recipes. Please try again later.',
        snackPosition: SnackPosition.BOTTOM,
      );
      print('Error fetching recipes: $error');
    } finally {
      _loading.value = false;
      update();
    }
  }
  // Future<void> getRecipes() async {
  //   _loading.value = true;
  //   _recipeModel = await RecipeApi.getRecipe();
  //   _loading.value = false;
  //   update();
  // }

  /// Fetches categories from the service.
  void getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
          CategoryModel.fromJson(value[i].data() as Map<String, dynamic>),
        );
        _loading.value = false;
      }
      update();
    });
  }
}
