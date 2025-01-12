import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:novel_app/app/modules/library/controllers/library_controller.dart';
import 'package:novel_app/app/routes/app_pages.dart';
import 'package:novel_app/app/utils/app_colors.dart';
import 'package:novel_app/app/utils/app_font_weight.dart';
import 'package:novel_app/app/services/theme_service.dart';

class LibraryView extends StatelessWidget {
  LibraryView({super.key});

  final LibraryController libraryController = Get.find<LibraryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Obx(() {
        return ListView(
          children: [
            SizedBox(height: 22.h),
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'My Library',
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: AppFontWeight.bold,
                    ),
                  ),
                  Text(
                    '${libraryController.libraryModel.length} Novels',
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

  Widget _gridList() {
    if (libraryController.libraryModel.isNotEmpty) {
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
        itemCount: libraryController.libraryModel.length,
        itemBuilder: (context, index) {
          final novel = libraryController.libraryModel[index];
          return ZoomTapAnimation(
            onTap: () {
              Get.toNamed(Routes.details, arguments: novel.id);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: CachedNetworkImage(
                    imageUrl: 'https://test4u.kacs.my${novel.cover?.url}',
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        color: Color(0xffD9D9D9),
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
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 70.h),
            SvgPicture.asset(
              'assets/bibliophile.svg',
              height: 219.h,
            ),
            SizedBox(height: 32.h),
            Text(
              'No data available',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: AppFontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Bookmark any novel to get started.',
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
