import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';

class FiveScreen extends StatelessWidget {
  const FiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.black,
        body: Column(
          children: [
            Container(
              width: 291,
              child: Image(
                image: AssetImage(AppAssets.icon_islami),
              ),
            ),
            Spacer(),
            Container(
              child: Image(
                image: AssetImage(AppAssets.image_radio),
              ),
            ),
            // Spacer(),
            Text(
              "Holy Quran Radio",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColor.gold),
            ),
            // Spacer(),
            Text(
              "You can listen to the Holy Quran Radio through the application for free and easily",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: AppColor.gold,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
