import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:novel_app/app/modules/details/controllers/details_controller.dart';
import 'package:novel_app/app/modules/library/controllers/library_controller.dart';
import 'package:novel_app/app/utils/app_colors.dart';
import 'package:novel_app/app/utils/app_font_weight.dart';
import 'package:novel_app/app/services/theme_service.dart';

class DetailsView extends StatelessWidget {
  DetailsView({super.key});

  final LibraryController libraryController = Get.find<LibraryController>();
  final DetailsController detailsController = Get.find<DetailsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => ThemeService().switchTheme(),
            icon: Icon(Icons.dark_mode_outlined),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: IconButton(
              onPressed: () {
                detailsController.isBookmark.value
                    ? libraryController.removeFromLibrary(
                        detailsController.detailsModel.value.id)
                    : libraryController
                        .addToLibrary(detailsController.detailsModel.value);
                Get.snackbar(
                  detailsController.isBookmark.value
                      ? 'Remove from Library'
                      : 'Added to Library',
                  detailsController.isBookmark.value
                      ? '${detailsController.detailsModel.value.title} remove from your library'
                      : '${detailsController.detailsModel.value.title} added to your library',
                  snackPosition: SnackPosition.BOTTOM,
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              },
              icon: detailsController.isBookmark.value
                  ? Icon(Icons.bookmark)
                  : Icon(Icons.bookmark_border_outlined),
              color: detailsController.isBookmark.value
                  ? AppColors.primary
                  : Colors.black,
            ),
          ),
        ],
      ),
      body: Obx(() {
        final novel = detailsController.detailsModel.value;

        if (detailsController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (detailsController.errorMessage.isNotEmpty) {
          // return Center(
          //   child: Text(
          //     detailsController.errorMessage.value,
          //     textAlign: TextAlign.center,
          //   ),
          // );
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/access-denied.svg',
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
            SizedBox(height: 22),
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 22, right: 22),
                child: Text(
                  novel.title ?? 'No Title',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 22, right: 22),
                child: Text(
                  novel.author ?? 'No Author',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff828386),
                  ),
                ),
              ),
            ),
            SizedBox(height: 22),
            Center(
              child: CachedNetworkImage(
                imageUrl: 'https://test4u.kacs.my${novel.cover?.url}',
                imageBuilder: (context, imageProvider) => Container(
                  width: 224,
                  height: 330,
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
            SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (var i = 0; i < novel.ratings!.toInt(); i++)
                  Icon(Icons.star, color: Colors.amber),
                for (var i = 0; i < 5 - novel.ratings!.toInt(); i++)
                  Icon(Icons.star, color: Color(0xffD9D9D9)),
                SizedBox(width: 12),
                Text(
                  novel.ratings!.toDouble().toString(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  ' / 5.0',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff828386),
                  ),
                ),
              ],
            ),
            SizedBox(height: 22),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Text(
                  novel.summary ?? 'No Summary',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 22),
          ],
        );
      }),
    );
  }
}
