import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';

class ThridScreen extends StatelessWidget {
  const ThridScreen({super.key});

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
            // Spacer(),
            Container(
              margin: EdgeInsets.all(10),
              child: Image(
                image: AssetImage(AppAssets.image_Quran),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Reading the Quran",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColor.gold),
            ),
            Spacer(),
            Text(
              "Read, and your Lord is the Most Generous",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: AppColor.gold,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
