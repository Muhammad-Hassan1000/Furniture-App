
//-------------------ADD TO WISHLIST----------------------
//STEP2
import 'package:arcore_flutter_plugin_example/models/favs_attr.dart';
import 'package:flutter/material.dart';

class WishlistProvider with ChangeNotifier {
  Map<String, WishListAttr> _wishlistItems = {};

  Map<String, WishListAttr> get getWishlistItems {
    return {..._wishlistItems};
  }

  //METHOD TO ADD ITEM TO WISHLIST
  void addToWishlist(String productId,String title, String imageUrl, double price) {
    if(_wishlistItems.containsKey(productId)) {
      removeItem(productId);
    } else {
      _wishlistItems.putIfAbsent(productId, () => WishListAttr(title: title, price: price, imageUrl: imageUrl));
    }
    notifyListeners();
  }

  //METHOD TO REMOVE ITEMS FROM WISHLIST
  void removeItem(String productId) {
    _wishlistItems.remove(productId);
    notifyListeners();
  }

  void clearWishList() {
    _wishlistItems.clear();
    notifyListeners();
  }

}
//->MOVE TO wishlist.dart