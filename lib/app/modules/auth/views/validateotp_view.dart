import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:novel_app/app/modules/auth/controllers/validateotp_controller.dart';
import 'package:novel_app/app/utils/app_colors.dart';
import 'package:novel_app/app/utils/app_font_weight.dart';

class ValidateotpView extends StatelessWidget {
  ValidateotpView({super.key});

  final ValidateotpController validateotpController =
      Get.find<ValidateotpController>();

  @override
  Widget build(BuildContext context) {
    final emailAddress = Get.arguments['email'];
    final otp = Get.arguments['otp'];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _appBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 22, right: 22, bottom: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: 44.h),
                  Text(
                    'Verification Code.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 26.sp,
                      fontWeight: AppFontWeight.black,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    'Please type the verification code sent to\n$emailAddress',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: AppFontWeight.semiBold,
                      color: AppColors.darkGrey,
                    ),
                  ),
                  SizedBox(height: 44.h),
                  Text(
                    'This function is still work in progress, your code is',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: AppFontWeight.regular,
                      color: AppColors.darkGrey,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    otp,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: AppFontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 44.h),
                  OtpTextField(
                    numberOfFields: 6,
                    borderColor: Color(0xFF512DA8),
                    showFieldAsBox: true,
                    onSubmit: (String verificationCode) {
                      validateotpController.validateOtp(
                        emailAddress,
                        verificationCode,
                      );
                    },
                  ),
                ],
              ),
              // ZoomTapAnimation(
              //   onTap: () => {},
              //   child: Container(
              //     width: double.infinity,
              //     height: 52.sp,
              //     decoration: BoxDecoration(
              //       color: AppColors.primary,
              //       borderRadius: BorderRadius.circular(4),
              //     ),
              //     child: Center(
              //       child: Text(
              //         'Verify',
              //         style: GoogleFonts.poppins(
              //           fontSize: 14.sp,
              //           fontWeight: AppFontWeight.bold,
              //           color: AppColors.white,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
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
