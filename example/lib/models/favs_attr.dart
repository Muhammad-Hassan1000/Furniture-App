//-------------------ADD TO WISHLIST----------------------
//STEP1

import 'package:flutter/material.dart';

class WishListAttr with ChangeNotifier {
  final  String title;
  final String imageUrl;
  final double price;

  WishListAttr({ this.title,  this.price,  this.imageUrl});
}

//->MOVE TO wishlist_provider