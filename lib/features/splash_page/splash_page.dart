import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/features/layout/page/home_page.dart';
import 'package:islami/features/onboard/onboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  static final Duration _duration = Duration(milliseconds: 1750);
  static const String routeName="SplashPage";
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(milliseconds: 2100),
      () async {
        final  prefs = await SharedPreferences.getInstance();
        final onboarding=prefs.getBool("onboarding")??false;
        Navigator.pushReplacementNamed(context, onboarding?HomePage.routeName:OnboardScreen.routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AppAssets.background_splash,
              ),
              fit: BoxFit.cover,
          ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              FadeInDown(
                duration: SplashPage._duration,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image(
                    image: AssetImage(
                      AppAssets.icon_glow,
                    ),
                    height: size.height * 0.30,
                  ),
                ),
              ),
              FadeInUp(
                duration: SplashPage._duration,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image(
                    image: AssetImage(
                      AppAssets.icon_Mosque,
                    ),
                    height: size.height * 0.20,
                  ),
                ),
              ),
              FadeInUp(
                duration: SplashPage._duration,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image(
                    image: AssetImage(
                      AppAssets.icon_Route,
                    ),
                    height: size.height * 0.18,
                    width: size.width * 0.60,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: ZoomIn(
                  duration: SplashPage._duration,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage(
                        AppAssets.icon_splash,
                      ),
                      height: size.height * 0.20,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.23),
                child: ZoomIn(
                  duration: SplashPage._duration,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage(
                        AppAssets.icon_text_islami,
                      ),
                      width: size.width * 0.4,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: size.height * 0.30),
                child: FadeInLeft(
                  duration: SplashPage._duration,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image(
                      image: AssetImage(
                        AppAssets.icon_shape_left,
                      ),
                      width: size.width * 0.25,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.45),
                child: FadeInRight(
                  duration: SplashPage._duration,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image(
                      image: AssetImage(
                        AppAssets.icon_shape_right,
                      ),
                      width: size.width * 0.25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
