import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:novel_app/app/modules/auth/controllers/login_controller.dart';
import 'package:novel_app/app/routes/app_pages.dart';
import 'package:novel_app/app/utils/app_colors.dart';
import 'package:novel_app/app/utils/app_font_weight.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: _appBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 22, right: 22, bottom: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox.shrink(),
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/reading-time.svg',
                    height: 219.h,
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    'Welcome to Novel',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: AppFontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'A modern reading platform to explore and\nenjoy engaging stories.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: AppFontWeight.regular,
                      color: AppColors.lightGrey,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: TextField(
                      maxLines: null,
                      expands: true,
                      controller: loginController.emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.white,
                        hintText: 'Enter your email address',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: AppFontWeight.semiBold,
                          color: AppColors.darkGrey,
                        ),
                        prefixIcon: Icon(Icons.email_outlined),
                        prefixIconColor: AppColors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  ZoomTapAnimation(
                    onTap: () => loginController.login(),
                    child: Container(
                      width: double.infinity,
                      height: 52.h,
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          'Log in',
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: AppFontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account? ',
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: AppFontWeight.semiBold,
                          color: AppColors.white,
                        ),
                      ),
                      ZoomTapAnimation(
                        onTap: () => Get.toNamed(Routes.signup),
                        child: Text(
                          'Sign up',
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: AppFontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
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
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
