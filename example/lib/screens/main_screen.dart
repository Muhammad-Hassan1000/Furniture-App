import 'package:arcore_flutter_plugin_example/inner_screens/upload_product_form.dart';
import 'package:arcore_flutter_plugin_example/screens/bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreens extends StatelessWidget {
  const MainScreens({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [BottomBarScreen(), UploadProductForm()],
    );
  }
}
