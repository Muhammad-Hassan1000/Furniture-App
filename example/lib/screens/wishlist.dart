import 'package:arcore_flutter_plugin_example/consts/colors.dart';
import 'package:arcore_flutter_plugin_example/consts/my_icons.dart';
import 'package:arcore_flutter_plugin_example/provider/favs_provider.dart';
import 'package:arcore_flutter_plugin_example/services/global_method.dart';
import 'package:arcore_flutter_plugin_example/widgets/wishlist_empty.dart';
import 'package:arcore_flutter_plugin_example/widgets/wishlist_full.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/WishlistScreen';

  @override
  Widget build(BuildContext context) {
    //-------------------ADD TO WISHLIST----------------------
    //STEP3
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    GlobalMethods globalMethods = GlobalMethods();
    return wishlistProvider.getWishlistItems.isEmpty
    //-> MOVE TO ListViewBuilder
        ? Scaffold(body: WishlistEmpty())
        : Scaffold(
      appBar: AppBar(
        title: Text('Wishlist (${wishlistProvider.getWishlistItems.length})'),
        actions: [
          IconButton(
            onPressed: () {
              globalMethods.showDialogg(
                  'Clear Wishlist',
                  'Your wishlist will be cleared',
                      () =>
                      wishlistProvider.clearWishList(), context
              );

            },
            icon: Icon(MyAppIcons.trash),
          )
        ],
      ),
      body: ListView.builder(
        //-------------------ADD TO WISHLIST----------------------
        //STEP4
        itemCount: wishlistProvider.getWishlistItems.length,
        //-> MOVE TO wishListFull.dart
        itemBuilder: (BuildContext ctx, int index) {
          //-------------------ADD TO WISHLIST----------------------
          //STEP7
          return ChangeNotifierProvider.value(
            value: wishlistProvider.getWishlistItems.values.toList()[index],
              child: WishlistFull(
              productId: wishlistProvider.getWishlistItems.keys.toList()[index],
          ));
          //->MOVE TO product_details
        },
      ),
    );
  }
}
