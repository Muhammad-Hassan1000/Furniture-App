
import 'package:badges/badges.dart';
import 'package:arcore_flutter_plugin_example/consts/colors.dart';
import 'package:arcore_flutter_plugin_example/consts/my_icons.dart';
import 'package:arcore_flutter_plugin_example/models/product.dart';
import 'package:arcore_flutter_plugin_example/provider/cart_provider.dart';
import 'package:arcore_flutter_plugin_example/provider/favs_provider.dart';
import 'package:arcore_flutter_plugin_example/provider/products.dart';
import 'package:arcore_flutter_plugin_example/screens/wishlist.dart';
import 'package:arcore_flutter_plugin_example/widgets/feeds_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart.dart';



class Feeds extends StatelessWidget {

  static const routeName = '/Feeds';
  @override
  Widget build(BuildContext context) {
    //-------------------------66.VIEW ALL PRODUCTS BUTTON FIX-------------------------------
    //final popular = ModalRoute.of(context)?.settings.arguments as String;
    final popular = ModalRoute.of(context)?.settings.arguments;
    final productsProvider = Provider.of<Products>(context);
    List<Product> productsList = productsProvider.products;
    if(popular == 'popular') {
      productsList = productsProvider.popularProducts;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        title: Text('Feeds'),
        actions: [
          Consumer<WishlistProvider>(
            builder: (_, favs, ch) => Badge(
              badgeColor: ColorConsts.cartBadgeColor,
              animationType: BadgeAnimationType.slide,
              toAnimate: true,
              position: BadgePosition.topEnd(top: 5, end: 7),
              badgeContent: Text(
                favs.getWishlistItems.length.toString(),
                style: TextStyle(color: Colors.white),
              ), // Text
              child: IconButton(
                icon: Icon(
                  MyAppIcons.wishlist,
                  color: ColorConsts.favColor,
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(WishlistScreen.routeName);
                },
              ),
            ),
          ),
          Consumer<CartProvider>(
          builder: (_, cart, ch) => Badge(
            badgeColor: ColorConsts.cartBadgeColor,
            animationType: BadgeAnimationType.slide,
            toAnimate: true,
            position: BadgePosition.topEnd(top: 5, end: 7),
            badgeContent: Text(
              cart.getCartItems.length.toString(),
              style: TextStyle(color: Colors.white),
            ), // Text
            child: IconButton(
              icon: Icon(
                MyAppIcons.cart,
                color: ColorConsts.cartColor,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(Cart.routeName);
              },
            ),
          ),
        ),
        ],
      ),
      body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240 / 420,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: List.generate(productsList.length, (index) {
            return ChangeNotifierProvider.value(
              value: productsList[index],
                child: FeedProducts());
          },
          ),
      ) // List.generate // Gridview.count
    );
  }
}// Scaffold