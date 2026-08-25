import 'package:get/get.dart';

class FavoriteController extends GetxController {
  
  var favoriteIds = <String>{}.obs;
  void toggleFavorite(String productId) {
    if (favoriteIds.contains(productId)) {
      favoriteIds.remove(productId);
    } else {
      favoriteIds.add(productId);
    }
  }

  bool isFavorite(String productId) {
    return favoriteIds.contains(productId);
  }
}