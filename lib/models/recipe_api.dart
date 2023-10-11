import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:tastequest/models/recipe_model.dart';

/// A class that handles API requests for recipes.
class RecipeApi {
  /// Fetches a list of recipes from the Yummly API.
  ///
  /// Returns a list of [RecipeModel] objects.
  static Future<List<RecipeModel>> getRecipe() async {
    var uri = Uri.https(
      'yummly2.p.rapidapi.com',
      '/feeds/list',
      {'limit': '24', 'start': '0', 'tag': 'list.recipe.popular'},
    );

    final response = await http.get(
      uri,
      headers: {
        'X-RapidAPI-Key': '1f805bcda7mshfb075705d0763e1p197a60jsndd3a2385887b',
        'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
        'useQueryString': 'true',
      },
    );

    Map data = jsonDecode(response.body);

    List _temp = [];
    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return RecipeModel.recipesFromSnapshot(_temp);
  }
}
