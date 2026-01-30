import 'package:shared_preferences/shared_preferences.dart';

class FavoriteCityStorage {
  static const String _key = 'favorite_city_ids';

  static Future<Set<String>> getFavoriteCityIds() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? ids = prefs.getStringList(_key);
    return ids?.toSet() ?? {};
  }

  static Future<void> addFavorite(String cityId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavoriteCityIds();
    favorites.add(cityId);
    await prefs.setStringList(_key, favorites.toList());
  }

  static Future<void> removeFavorite(String cityId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavoriteCityIds();
    favorites.remove(cityId);
    await prefs.setStringList(_key, favorites.toList());
  }

  static Future<bool> isFavorite(String cityId) async {
    final favorites = await getFavoriteCityIds();
    return favorites.contains(cityId);
  }
}

