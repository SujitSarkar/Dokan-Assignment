import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../account/presentation/screens/accrount_screen.dart';
import '../../cart/presentation/screens/cart_screen.dart';
import '../../category/presentation/screens/category_screen.dart';
import '../../home/presentation/screens/screen_imports.dart';

class NavBarController extends GetxController {
  RxInt visit = 0.obs;
  List<IconData> items = const [
    FeatherIcons.home,
    FeatherIcons.grid,
    FeatherIcons.shoppingCart,
    FeatherIcons.user,
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
