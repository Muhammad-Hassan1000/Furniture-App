import 'package:arcore_flutter_plugin_example/screens/splashscreen.dart';
import 'package:flutter/material.dart';



import 'package:arcore_flutter_plugin_example/consts/theme_data.dart';
import 'package:arcore_flutter_plugin_example/inner_screens/categories_feed.dart';
import 'package:arcore_flutter_plugin_example/inner_screens/product_details.dart';
import 'package:arcore_flutter_plugin_example/provider/cart_provider.dart';
import 'package:arcore_flutter_plugin_example/provider/dark_theme_provider.dart';
import 'package:arcore_flutter_plugin_example/provider/products.dart';
import 'package:arcore_flutter_plugin_example/provider/favs_provider.dart';
import 'package:arcore_flutter_plugin_example/screens/auth/login.dart';
import 'package:arcore_flutter_plugin_example/screens/auth/sign_up.dart';
import 'package:arcore_flutter_plugin_example/screens/bottom_bar.dart';
import 'package:arcore_flutter_plugin_example/screens/cart.dart';
import 'package:arcore_flutter_plugin_example/screens/feeds.dart';
import 'package:arcore_flutter_plugin_example/screens/landing_page.dart';
import 'package:arcore_flutter_plugin_example/screens/main_screen.dart';
import 'package:arcore_flutter_plugin_example/screens/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'inner_screens/brands_navigation_rail.dart';
import 'inner_screens/upload_product_form.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   //where to go
    //   debugShowCheckedModeBanner: false,
    //   home: MySplashScreen(),
    // );


    DarkThemeProvider themeChangeProvider = new DarkThemeProvider();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themeChangeProvider;
          }),
          ChangeNotifierProvider(create: (_) =>
              Products(),
          ),
          ChangeNotifierProvider(create: (_) =>
              CartProvider(),
          ),
          ChangeNotifierProvider(create: (_) =>
              WishlistProvider(),
          ),
        ],
        child:
        Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: MainScreens(),
            //initialRoute: '/',
            routes: {
              //   '/': (ctx) => LandingPage(),
              BrandNavigationRailScreen.routeName: (ctx) => BrandNavigationRailScreen(),
              Cart.routeName: (ctx) => Cart(),
              Feeds.routeName: (ctx) => Feeds(),
              WishlistScreen.routeName: (ctx) => WishlistScreen(),
              ProductDetails.routeName: (ctx) => ProductDetails(),
              CategoriesFeedScreen.routeName: (ctx) => CategoriesFeedScreen(),
              LoginScreen.routeName: (ctx) => LoginScreen(),
              SignUpScreen.routeName: (ctx) => SignUpScreen(),
              BottomBarScreen.routeName: (ctx) => BottomBarScreen(),
              // UploadProductForm.routeName: (ctx) => UploadProductForm(),
               MySplashScreen.routeName: (ctx) => MySplashScreen(),

            },
          );
        }));

  }
}
