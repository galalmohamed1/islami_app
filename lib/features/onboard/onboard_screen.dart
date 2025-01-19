import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:islami/features/layout/page/home_page.dart';
import 'package:islami/features/onboard/first_screen.dart';
import 'package:islami/features/onboard/five_screen.dart';
import 'package:islami/features/onboard/four_screen.dart';
import 'package:islami/features/onboard/second_screen.dart';
import 'package:islami/features/onboard/thrid_screen.dart';
import 'package:islami/features/splash_page/widget/animation_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardScreen extends StatefulWidget {
  static const String routeName="OnboardScreen";
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  PageController _controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              controller: _controller,
              children: [
                FirstScreen(),
                SecondScreen(),
                ThridScreen(),
                FourScreen(),
                FiveScreen(),
              ],
            ),
          ),
          Container(
            color: AppColor.black,
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    _controller.animateToPage(index - 1,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.linear);
                  },
                  child: Text(
                    index == 0 ? "" : "Back",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColor.gold),
                  ),
                ),
                Spacer(),
                AnimationControl(active: index == 0),
                SizedBox(
                  width: 10,
                ),
                AnimationControl(active: index == 1),
                SizedBox(
                  width: 10,
                ),
                AnimationControl(active: index == 2),
                SizedBox(
                  width: 10,
                ),
                AnimationControl(active: index == 3),
                SizedBox(
                  width: 10,
                ),
                AnimationControl(active: index == 4),
                Spacer(),
                TextButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool("onboarding", true);
                    if (!mounted) return;
                    index == 4
                        ? Navigator.pushReplacementNamed(context, HomePage.routeName)
                        : _controller.animateToPage(index + 1,
                            duration: Duration(milliseconds: 250),
                            curve: Curves.linear);
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColor.gold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
