import 'package:flutter/material.dart';
import 'package:islami/core/services/local_storage_service.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:islami/features/layout/hadith_page/widget/hadith_details.dart';
import 'package:islami/features/layout/page/home_page.dart';
import 'package:islami/features/layout/quran_page/quran_details.dart';
import 'package:islami/features/onboard/onboard_screen.dart';
import 'package:islami/features/splash_page/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

  // WidgetsFlutterBinding.ensureInitialized();


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final onboarding = prefs.getBool("onboarding") ?? false;
  await LocalStorageService.init();
  runApp(MyApp(
    onboarding: onboarding,
  ));
}

class MyApp extends StatelessWidget {
  final bool onboarding;

  const MyApp({super.key, this.onboarding = false});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islami',
      theme: ThemeData(
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        scrolledUnderElevation: 1,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColor.gold,
      ),
    ),
      initialRoute:  SplashPage.routeName,
      routes: {
        SplashPage.routeName: (_) => SplashPage(),
        OnboardScreen.routeName: (_) => OnboardScreen(),
        HomePage.routeName: (_) => HomePage(),
        QuranDetails.routeName: (_) => QuranDetails(),
        HadithDetails.routeName: (_) => HadithDetails(),

      },
    );
  }
}
