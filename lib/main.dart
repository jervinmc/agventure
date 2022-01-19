
import 'package:agadventure/pages/menu/views.dart';
import 'package:agadventure/pages/options/views.dart';
import 'package:agadventure/pages/profile/views.dart';
import 'package:agadventure/pages/questionaire/views.dart';
import 'package:agadventure/pages/results/views.dart';
import 'package:agadventure/pages/rules/views.dart';
import 'package:agadventure/pages/starting/views.dart';
import 'package:agadventure/pages/tutorial/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter',
      theme: ThemeData(
      ),
      getPages: [
        GetPage(name: "/rules", page:()=>Rules()),
        GetPage(name: "/starting", page:()=>Starting()),
        GetPage(name: "/menu", page:()=>VegetableList()),
        GetPage(name: "/tutorial", page:()=>Tutorial()),
        GetPage(name: "/questionaire", page:()=>Questionaire()),
        GetPage(name: "/results", page:()=>Results()),
        GetPage(name: "/profile", page:()=>Profile()),
        GetPage(name: "/startingfirst", page:()=>StartingPage()),
        // GetPage(name: "/products", page:()=>Products()),
        // GetPage(name: "/cart", page:()=>Cart()),
        // GetPage(name: "/favorites", page:()=>Favorites()),
        // GetPage(name: "/product_details", page:()=>ProductDetails()),
      ],
      initialRoute: "/startingfirst",
    );
  }
}
