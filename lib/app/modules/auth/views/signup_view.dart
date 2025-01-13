import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:novel_app/app/modules/auth/controllers/signup_controller.dart';
import 'package:novel_app/app/utils/app_colors.dart';
import 'package:novel_app/app/utils/app_font_weight.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});

  final SignupController signupController = Get.find<SignupController>();
  final List<String> genderList = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _appBar(),
      body: Obx(() {
        if (signupController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (signupController.errorMessage.isNotEmpty) {
          // return Center(
          //   child: Text(
          //     searchNovelController.errorMessage.value,
          //     textAlign: TextAlign.center,
          //   ),
          // );
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

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 22, right: 22, bottom: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(height: 44.h),
                    Column(
                      children: [
                        Text(
                          'Create an Account.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 26.sp,
                            fontWeight: AppFontWeight.black,
                            color: AppColors.primary,
                          ),
                        ),
                        Text(
                          'Sign up to get started',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: AppFontWeight.semiBold,
                            color: AppColors.darkGrey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 44.h),
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 52.h,
                          child: TextField(
                            maxLines: null,
                            expands: true,
                            controller: signupController.emailController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.lightGrey,
                              hintText: 'Email address',
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
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                height: 52.h,
                                child: TextField(
                                  maxLines: null,
                                  expands: true,
                                  controller:
                                      signupController.firstNameController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColors.lightGrey,
                                    hintText: 'First name',
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 14.sp,
                                      fontWeight: AppFontWeight.semiBold,
                                      color: AppColors.darkGrey,
                                    ),
                                    prefixIcon: Icon(Icons.person_outline),
                                    prefixIconColor: AppColors.black,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 14.w),
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                height: 52.h,
                                child: TextField(
                                  maxLines: null,
                                  expands: true,
                                  controller:
                                      signupController.lastNameController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColors.lightGrey,
                                    hintText: 'Last name',
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 14.sp,
                                      fontWeight: AppFontWeight.semiBold,
                                      color: AppColors.darkGrey,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 14.h),
                        Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 52.h,
                              padding: EdgeInsets.only(left: 12, right: 12),
                              decoration: BoxDecoration(
                                  color: AppColors.lightGrey,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.people_outline_outlined,
                                      color: AppColors.black,
                                    ),
                                    Expanded(
                                      child: DropdownButton(
                                        isExpanded: true,
                                        underline: SizedBox.shrink(),
                                        padding: EdgeInsets.only(left: 12),
                                        style: GoogleFonts.poppins(
                                          fontSize: 14.sp,
                                          fontWeight: AppFontWeight.semiBold,
                                          color: AppColors.darkGrey,
                                        ),
                                        value: signupController
                                            .selectedGender.value,
                                        onChanged: (value) => signupController
                                            .updateGender(value.toString()),
                                        items: genderList
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 14.h),
                            Container(
                              width: double.infinity,
                              height: 52.h,
                              padding: EdgeInsets.only(left: 12, right: 12),
                              decoration: BoxDecoration(
                                  color: AppColors.lightGrey,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.flag_outlined,
                                      color: AppColors.black,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: 50.w,
                                        height: 50.h,
                                        child: DropdownButton(
                                          isExpanded: true,
                                          underline: SizedBox.shrink(),
                                          padding: EdgeInsets.only(left: 12),
                                          style: GoogleFonts.poppins(
                                            fontSize: 14.sp,
                                            fontWeight: AppFontWeight.semiBold,
                                            color: AppColors.darkGrey,
                                          ),
                                          value: signupController
                                              .selectedCountryCode.value,
                                          onChanged: (value) => signupController
                                              .updateCountryCode(
                                                  value.toString()),
                                          items: signupController.signupModel
                                              .map((value) {
                                            return DropdownMenuItem(
                                              value: value.code,
                                              child: Text(value.name!),
                                              onTap: () => signupController
                                                  .selectedCountryDialCode
                                                  .value = value.dialCode!,
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 14.h),
                        Row(
                          children: [
                            Flexible(
                              child: SizedBox(
                                width: double.infinity,
                                height: 52.h,
                                child: TextField(
                                  maxLines: null,
                                  expands: true,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColors.lightGrey,
                                    hintText: signupController
                                        .selectedCountryDialCode.value,
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 14.sp,
                                      fontWeight: AppFontWeight.semiBold,
                                      color: AppColors.black,
                                    ),
                                    prefixIcon: Icon(Icons.phone_outlined),
                                    prefixIconColor: AppColors.black,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 14.w),
                            Flexible(
                              flex: 2,
                              child: SizedBox(
                                width: double.infinity,
                                height: 52.h,
                                child: TextField(
                                  maxLines: null,
                                  expands: true,
                                  controller:
                                      signupController.phoneNumberController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColors.lightGrey,
                                    hintText: '123456789',
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 14.sp,
                                      fontWeight: AppFontWeight.semiBold,
                                      color: AppColors.darkGrey,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: AppFontWeight.semiBold,
                            color: AppColors.darkGrey,
                          ),
                        ),
                        ZoomTapAnimation(
                          onTap: () => Get.back(),
                          child: Text(
                            'Log in',
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: AppFontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    ZoomTapAnimation(
                      onTap: () => signupController.signup(),
                      child: Container(
                        width: double.infinity,
                        height: 52.h,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            'Sign up',
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
              ],
            ),
          ),
        );
      }),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(left: 6),
        child: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
