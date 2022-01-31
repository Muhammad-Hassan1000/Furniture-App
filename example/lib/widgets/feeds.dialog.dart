import 'package:arcore_flutter_plugin_example/consts/colors.dart';
import 'package:arcore_flutter_plugin_example/consts/my_icons.dart';
import 'package:arcore_flutter_plugin_example/inner_screens/product_details.dart';
import 'package:arcore_flutter_plugin_example/models/product.dart';
import 'package:arcore_flutter_plugin_example/provider/cart_provider.dart';
import 'package:arcore_flutter_plugin_example/provider/dark_theme_provider.dart';
import 'package:arcore_flutter_plugin_example/provider/favs_provider.dart';
import 'package:arcore_flutter_plugin_example/provider/products.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:provider/provider.dart';

class FeedDialog extends StatelessWidget {
  final String productId;
  const FeedDialog({this.productId});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context, listen: false);
    final prodAttr = productsData.findById(productId);
    final cartProvider = Provider.of<CartProvider>(context);
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            constraints: BoxConstraints(
                minHeight: 100,
                maxHeight: MediaQuery.of(context).size.height * 0.5),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Image.network(prodAttr.imageUrl),
          ),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: dialogContent(
                        context,
                        0,
                        () => {
                              wishlistProvider.addToWishlist(
                                  productId,
                                  prodAttr.title,
                                  prodAttr.imageUrl,
                                  prodAttr.price),
                              //The code below ensures that as sson as the user clicks on wishlist the feeds screen is displayed again
                              Navigator.canPop(context)
                                  ? Navigator.pop(context)
                                  : null
                            }),
                  ),
                  Flexible(
                    child: dialogContent(
                        context,
                        1,
                        () => {
                          Navigator.pushNamed(
                              context, ProductDetails.routeName,
                              arguments: prodAttr.id).then((value) =>
                          Navigator.canPop(context)
                              ? Navigator.pop(context)
                              : null),
                        }),
                  ),
                  Flexible(
                    child: dialogContent(
                        context,
                        2,
                        () => {
                              cartProvider.addProductToCart(
                                  productId,
                                  prodAttr.imageUrl,
                                  prodAttr.title,
                                  prodAttr.price,
                                  prodAttr.quantity),
                              Navigator.canPop(context)
                                  ? Navigator.pop(context)
                                  : null
                            }),
                  ),
                ]),
          ),

          /************close****************/
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1.3),
                shape: BoxShape.circle),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                splashColor: Colors.grey,
                onTap: () =>
                    Navigator.canPop(context) ? Navigator.pop(context) : null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.close, size: 28, color: Colors.white),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget dialogContent(BuildContext context, int index, Function() fct) {
    final cart = Provider.of<CartProvider>(context);
    final favs = Provider.of<WishlistProvider>(context);
    List<IconData> _dialogIcons = [
      favs.getWishlistItems.containsKey(productId)
          ? Icons.favorite
          : Icons.favorite_border,
      FontAwesome5.eye,
      MyAppIcons.cart,
      MyAppIcons.trash,
    ];

    List<String> _texts = [
      favs.getWishlistItems.containsKey(productId)
          ? 'In wishlist'
          : 'Add to wishlist',
      'View product',
      cart.getCartItems.containsKey(productId) ? 'In Cart ' : 'Add to cart',
    ];
    List<Color> _colors = [
      favs.getWishlistItems.containsKey(productId)
          ? Colors.red
          : Theme.of(context).textSelectionColor,
      Theme.of(context).textSelectionColor,
      Theme.of(context).textSelectionColor,
    ];
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return FittedBox(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: fct,
          splashColor: Colors.grey,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.25,
            padding: EdgeInsets.all(4),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: const Offset(0.0, 10.0),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    // inkwell color
                    child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(
                          _dialogIcons[index],
                          color: _colors[index],
                          size: 25,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FittedBox(
                    child: Text(
                      _texts[index],
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        //  fontSize: 15,
                        color: themeChange.darkTheme
                            ? Theme.of(context).disabledColor
                            : ColorConsts.subtitle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
