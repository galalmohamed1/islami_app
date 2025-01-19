import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

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
            Container(
              margin: EdgeInsets.all(10),
              child: Image(
                image: AssetImage(AppAssets.image_mosque),
              ),
            ),
            Text(
              "Welcome To Islmi",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColor.gold),
            ),
            Spacer(),
            Text(
              "We Are Very Excited To Have You In Our Community",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: AppColor.gold,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            // Spacer(),
          ],
        ),
      ),
    );
  }
}
