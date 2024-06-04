import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import '/core/constants/app_assets.dart';
import 'package:flutter_svg/svg.dart';
import '/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nav_bar_controller.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavBarController homeController = Get.put(NavBarController());
    return Obx(() => Scaffold(
        body: IndexedStack(
          index: homeController.visit.value,
          children: homeController.pages,
        ),
        floatingActionButton: MediaQuery.of(context).viewInsets.bottom == 0
            ? Container(
                height: 56,
                width: 56,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [
                          AppColors.primaryColor,
                          AppColors.secondaryColor,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight)),
                child: SvgPicture.asset(Assets.assetsSvgSearch),
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: homeController.items.length,
          activeIndex: homeController.visit.value,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.defaultEdge,
          leftCornerRadius: 12,
          rightCornerRadius: 12,
          onTap: (index) => homeController.itemOntTap(index),
          tabBuilder: (int index, bool isActive) {
            return Container(
              padding: const EdgeInsets.all(15),
              child: SvgPicture.asset(
                fit: BoxFit.fitHeight,
                homeController.items[index],
                colorFilter: ColorFilter.mode(
                    isActive
                        ? AppColors.primaryColor
                        : AppColors.navBarUnselectedIconColor,
                    BlendMode.srcIn),
              ),
            );
          },
        )));
  }
}
