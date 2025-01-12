import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:novel_app/app/modules/home/views/home_view.dart';
import 'package:novel_app/app/modules/search/views/search_view.dart';
import 'package:novel_app/app/modules/library/views/library_view.dart';
import 'package:novel_app/app/modules/account/views/account_view.dart';
import 'package:novel_app/app/modules/navbar/controllers/navbar_controller.dart';
import 'package:novel_app/app/utils/app_colors.dart';

class NavbarView extends StatelessWidget {
  NavbarView({super.key});

  final NavbarController navbarController = Get.find<NavbarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: navbarController.pageController,
          children: [
            HomeView(),
            SearchView(),
            LibraryView(),
            AccountView(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        notchMargin: 10,
        color: AppColors.primary,
        child: Container(
          padding: EdgeInsets.only(left: 6, right: 6),
          child: Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _bottomAppBarItem(
                  icon: Icons.home_outlined,
                  label: 'Home',
                  page: 0,
                ),
                _bottomAppBarItem(
                  icon: Icons.search_outlined,
                  label: 'Search',
                  page: 1,
                ),
                _bottomAppBarItem(
                  icon: Icons.library_books_outlined,
                  label: 'Library',
                  page: 2,
                ),
                _bottomAppBarItem(
                  icon: Icons.person_outline,
                  label: 'Account',
                  page: 3,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _bottomAppBarItem({required icon, required label, required page}) {
    return ZoomTapAnimation(
      onTap: () => navbarController.goToPage(page),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: navbarController.currentPage.value == page
                ? AppColors.white
                : AppColors.secondary,
          ),
          Text(
            label,
            style: TextStyle(
              color: navbarController.currentPage.value == page
                  ? AppColors.white
                  : AppColors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
