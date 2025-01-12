import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:novel_app/app/modules/home/controllers/home_controller.dart';
import 'package:novel_app/app/routes/app_pages.dart';
import 'package:novel_app/app/utils/app_colors.dart';
import 'package:novel_app/app/utils/app_font_weight.dart';
import 'package:novel_app/app/services/theme_service.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Obx(() {
        if (homeController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (homeController.errorMessage.isNotEmpty) {
          // return Center(child: Text(homeController.errorMessage.value));
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/page-not-found.svg',
                  height: 219.h,
                ),
                SizedBox(height: 32.h),
                Text(
                  'Oops!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    fontWeight: AppFontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Something went wrong.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: AppFontWeight.regular,
                    color: AppColors.darkGrey,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView(
          children: [
            SizedBox(height: 22.h),
            Padding(
              padding: EdgeInsets.only(left: 22, right: 22),
              child: Text(
                'Most Popular',
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: AppFontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            _mostPopularList(),
            SizedBox(height: 22.h),
            Padding(
              padding: EdgeInsets.only(left: 22, right: 22),
              child: Container(
                height: 140.h,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Image.asset('assets/banner.png', fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 22.h),
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'All Novel',
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: AppFontWeight.bold,
                    ),
                  ),
                  Text(
                    '${homeController.homeModel.length} Novels',
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: AppFontWeight.semiBold,
                      color: AppColors.darkGrey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            _gridList(),
            SizedBox(height: 22.h),
          ],
        );
      }),
    );
  }

  GridView _gridList() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 18,
        crossAxisSpacing: 18,
        childAspectRatio: (1 / 1.8),
      ),
      padding: EdgeInsets.only(left: 22, right: 22),
      itemCount: homeController.homeModel.length,
      itemBuilder: (context, index) {
        final novel = homeController.homeModel[index];
        return ZoomTapAnimation(
          onTap: () => Get.toNamed(Routes.details, arguments: novel.id),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: CachedNetworkImage(
                  imageUrl: 'https://test4u.kacs.my${novel.cover?.url}',
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.image),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                novel.title ?? 'No Title',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: AppFontWeight.bold,
                ),
              ),
              Text(
                novel.author ?? 'No Author',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: AppFontWeight.semiBold,
                  color: AppColors.darkGrey,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Container _mostPopularList() {
    return Container(
      height: 220.h,
      margin: EdgeInsets.only(left: 22),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homeController.homeModel.length,
        itemBuilder: (context, index) {
          final novel = homeController.homeModel[index];
          return Container(
            width: 122.w,
            margin: EdgeInsets.only(right: 18),
            child: ZoomTapAnimation(
              onTap: () => Get.toNamed(Routes.details, arguments: novel.id),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: CachedNetworkImage(
                      imageUrl: 'https://test4u.kacs.my${novel.cover?.url}',
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.image),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    novel.title ?? 'No Title',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      fontWeight: AppFontWeight.bold,
                    ),
                  ),
                  Text(
                    novel.author ?? 'No Author',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 11.sp,
                      fontWeight: AppFontWeight.semiBold,
                      color: AppColors.darkGrey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Padding(
        padding: const EdgeInsets.only(left: 6),
        child: Text(
          'Novel.',
          style: GoogleFonts.poppins(
            fontSize: 26.sp,
            fontWeight: AppFontWeight.black,
            color: AppColors.primary,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => ThemeService().switchTheme(),
          icon: Icon(Icons.dark_mode_outlined),
        ),
        Container(
          width: 40.w,
          height: 40.h,
          margin: EdgeInsets.only(right: 22),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            'assets/profile-picture.svg',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
