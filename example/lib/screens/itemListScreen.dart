import 'package:arcore_flutter_plugin_example/models/ItemModel.dart';
import 'package:arcore_flutter_plugin_example/screens/arViewScreen.dart';
import 'package:flutter/material.dart';

class ItemListScreen extends StatelessWidget {
  List<ItemModel> items = [
    ItemModel(
      'Double Bed',
      'Double Bed with 2 Lamps',
      'items/bed.png',
      12,
    ),
    ItemModel(
      'Single Sofa T55',
      'White Sofa for your Home',
      'items/sofa_white.png',
      16,
    ),
    ItemModel(
      'Double Sofa',
      'Three seater branded sofa',
      'items/sofa_yellow.png',
      10,
    ),
    ItemModel(
      'Chair Brown',
      'A small chair for your Backyard',
      'items/pc_table.png',
      6,
    ),
    ItemModel(
      'G78 Single Sofa',
      'Branded single yellow sofa',
      'items/single_sofa.png',
      10,
    ),
    ItemModel(
      'Dinner Table',
      'Beautiful dinner table for family',
      'items/dinner_table.png',
      11,
    ),
    ItemModel(
      'Branded PC Table',
      'PC Table for your Computer',
      'items/pc_table2.png',
      16,
    ),
    ItemModel(
      'Chair Short',
      'A small cheap chair',
      'items/chair2.png',
      11,
    ),
    ItemModel(
      'Wooden Table',
      'Wooden branded UK table',
      'items/table.png',
      16,
    ),
    ItemModel(
      'Single Sofa T55',
      'White Sofa for your Home',
      'items/bed_double.png',
      16,
    ),
    ItemModel(
      'Single Sofa T55',
      'White Sofa for your Home',
      'items/rot_chair.png',
      16,
    ),
    ItemModel(
      'Single Sofa T55',
      'White Sofa for your Home',
      'items/sofa_uk.png',
      16,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'AR',
                    style: TextStyle(fontSize: 48, color: Colors.white),
                  ),
                  Text(
                    'Furniture',
                    style: TextStyle(
                        fontSize: 38,
                        color: Colors.white,
                        fontWeight: FontWeight.w100),
                  ),
                  Text(
                    'App',
                    style: TextStyle(
                        fontSize: 38,
                        color: Colors.white,
                        fontWeight: FontWeight.w100),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                  ),
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ARViewScreen(
                                  itemImg: items[index].pic,
                                ),
                                ),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.asset(
                                "${items[index].pic}",
                                width: 60,
                              ),
                            ),
                            Expanded(
                                child: Column(
                              children: <Widget>[
                                Text(
                                  items[index].name,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                Text(
                                  items[index].detail,
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black87),
                                ),
                              ],
                            )),
                            Container(
                              width: 60,
                              child: Text(
                                items[index].price.toString(),
                                style:
                                    TextStyle(fontSize: 14, color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                    itemCount: items.length,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
