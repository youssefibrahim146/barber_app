import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app_router.dart';

void main() {
  // to fix text in release mode
  ScreenUtil.ensureScreenSize();
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'barber App',
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
