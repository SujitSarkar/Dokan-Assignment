import '/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../account/presentation/screens/screen_imports.dart';
import '../../cart/presentation/screens/cart_screen.dart';
import '../../category/presentation/screens/category_screen.dart';
import '../../home/presentation/screens/screen_imports.dart';

class NavBarController extends GetxController {
  RxInt visit = 0.obs;
  // List<IconData> items = const [
  //   FeatherIcons.home,
  //   FeatherIcons.grid,
  //   FeatherIcons.shoppingCart,
  //   FeatherIcons.user,
  // ];
  List<String> items = const [
    Assets.assetsSvgHome,
    Assets.assetsSvgCategory,
    Assets.assetsSvgCart,
    Assets.assetsSvgAccount,
  ];

  List<Widget> pages = const [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    AccountScreen()
  ];

  void itemOntTap(int index) {
    visit.value = index;
  }
}
