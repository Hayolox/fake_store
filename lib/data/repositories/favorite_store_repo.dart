import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/home_store_model.dart';

class FavoriteStoreRepo {
  Future<void> addFavorite(HomeStoreModel dataStoreModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? items = prefs.getStringList('items');

    items ??= [];

    if (!items.contains(jsonEncode(dataStoreModel.toJson()))) {
      items.add(jsonEncode(dataStoreModel.toJson()));

      await prefs.setStringList('items', items);
    }
  }

  Future<List<HomeStoreModel>> getFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? items = prefs.getStringList('items');

    if (items == null) {
      return [];
    }

    List<HomeStoreModel> favoriteStores = [];
    for (String item in items) {
      Map<String, dynamic> json = jsonDecode(item);
      favoriteStores.add(HomeStoreModel.fromJson(json));
    }

    return favoriteStores;
  }
}
