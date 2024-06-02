import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:feather_icons/feather_icons.dart';
import '/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../account/data/account_service.dart';
import '../../account/presentation/controllers/account_controller.dart';
import '../../home/data/home_service.dart';
import '../../home/presentation/controllers/home_controller.dart';
import '../controllers/nav_bar_controller.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController(HomeService()));
    Get.put(AccountController(AccountService()));

    final NavBarController homeController = Get.put(NavBarController());
    return Obx(() => Scaffold(
        body: IndexedStack(
          index: homeController.visit.value,
          children: homeController.pages,
        ),
        floatingActionButton: Container(
          height: 56,
          width: 56,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [
                AppColors.primaryColor,
                AppColors.secondaryColor,
              ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
          child: const Icon(
            FeatherIcons.search,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: homeController.items.length,
          activeIndex: homeController.visit.value,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          leftCornerRadius: 16,
          rightCornerRadius: 16,
          onTap: (index) => homeController.itemOntTap(index),
          tabBuilder: (int index, bool isActive) {
            return Icon(
              homeController.items[index],
              size: 24,
              color: isActive
                  ? AppColors.primaryColor
                  : AppColors.navBarUnselectedIconColor,
            );
          },
        )));
  }
}
