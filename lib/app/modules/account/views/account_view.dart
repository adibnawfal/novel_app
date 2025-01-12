import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:novel_app/app/routes/app_pages.dart';
import 'package:novel_app/app/utils/app_colors.dart';
import 'package:novel_app/app/utils/app_font_weight.dart';
import 'package:novel_app/app/services/theme_service.dart';

class AccountView extends StatelessWidget {
  AccountView({super.key});

  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 22, right: 22),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/swipe-profiles.svg',
                height: 219.h,
              ),
              SizedBox(height: 32.h),
              Text(
                'Work in progress',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: AppFontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Account features are still a work in progress.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: AppFontWeight.regular,
                  color: AppColors.darkGrey,
                ),
              ),
              Text(
                storage.read('loggedEmail'),
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: AppFontWeight.bold,
                  color: AppColors.darkGrey,
                ),
              ),
              SizedBox(height: 32.h),
              ZoomTapAnimation(
                onTap: () async {
                  await storage.remove('loggedEmail');
                  Get.offAllNamed(Routes.login);
                },
                child: Container(
                  width: double.infinity,
                  height: 52.h,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      'Log out',
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: AppFontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
