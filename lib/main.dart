import 'package:barber/constants/app_bindings%20.dart';
import 'package:barber/constants/app_imports.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

void main() async {
  /// Ensure that Flutter framework is initialized.
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize the Firebase services.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate();

  /// Fix text in release mode.
  ScreenUtil.ensureScreenSize();

  /// Start the execution by running MyApp widget.
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Customize the status bar color to be transparent
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
    );

    /// Initial configuration
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      child: GetMaterialApp(
        theme: ThemeData(
          splashColor: AppColors.transparent,
          highlightColor: AppColors.transparent,
        ),
        debugShowCheckedModeBanner: false,
        initialBinding: AppBindings(),
        initialRoute: FirebaseAuth.instance.currentUser != null &&
                FirebaseAuth.instance.currentUser!.emailVerified
            ? AppStrings.homeRoute
            : AppStrings.getStartedRoute,
        getPages: AppRouter.appPages,
        title: AppStrings.appTitle,
      ),
    );
  }
}
