import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.black,
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
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
                image: AssetImage(AppAssets.image_Welcome),
              ),
            ),
            Spacer(),
            Container(
              child: Text(
                "Welcome To Islmi App",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: AppColor.gold),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
