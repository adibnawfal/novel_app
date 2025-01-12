import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:novel_app/app/modules/auth/controllers/login_controller.dart';
import 'package:novel_app/app/routes/app_pages.dart';
import 'package:novel_app/app/services/theme_service.dart';

void main() async {
  await GetStorage.init();
  runApp(
    ScreenUtilInit(
      designSize: Size(393, 808),
      builder: (context, child) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Novel.',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeService().theme,
      initialRoute: Routes.login,
      getPages: AppPages.routes,
      onReady: () => Get.find<LoginController>().navigateBasedOnLogin(),
    );
  }
}
