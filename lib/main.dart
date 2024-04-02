import 'constants/app_imports.dart';

void main() {
  // to fix text in release mode
  ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: AppRouter.appPages,
        title: 'barber App',
      ),
    );
  }
}
