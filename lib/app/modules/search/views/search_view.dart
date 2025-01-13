import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:novel_app/app/modules/search/controllers/search_novel_controller.dart';
import 'package:novel_app/app/routes/app_pages.dart';
import 'package:novel_app/app/utils/app_colors.dart';
import 'package:novel_app/app/utils/app_font_weight.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  final SearchNovelController searchNovelController =
      Get.find<SearchNovelController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(() {
        if (searchNovelController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (searchNovelController.errorMessage.isNotEmpty) {
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

        return ListView(
          children: [
            SizedBox(height: 22.h),
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22),
              child: SizedBox(
                width: double.infinity,
                height: 52.h,
                child: TextField(
                  maxLines: null,
                  expands: true,
                  onChanged: (value) =>
                      searchNovelController.filterNovel(value),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.lightGrey,
                    hintText: 'Search by title',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: AppFontWeight.semiBold,
                      color: AppColors.darkGrey,
                    ),
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: AppColors.black,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
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
                    'Result',
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: AppFontWeight.bold,
                    ),
                  ),
                  Text(
                    '${searchNovelController.filterData.length} Novels',
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
    if (searchNovelController.filterData.isNotEmpty) {
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
        itemCount: searchNovelController.filterData.length,
        itemBuilder: (context, index) {
          final novel = searchNovelController.filterData[index];
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
            SizedBox(height: 44.h),
            SvgPicture.asset(
              'assets/faq.svg',
              height: 219.h,
            ),
            SizedBox(height: 32.h),
            Text(
              'No results found',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: AppFontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Try searching again.',
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
}
