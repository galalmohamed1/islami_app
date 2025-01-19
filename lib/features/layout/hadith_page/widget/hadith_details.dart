import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:islami/models/hadith_data.dart';

class HadithDetails extends StatelessWidget {
  static const String routeName="HadithDetails";
  const HadithDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var arg= ModalRoute.of(context)?.settings.arguments as HadithData ;
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      appBar: AppBar(
        backgroundColor: AppColor.black,
        iconTheme: IconThemeData(color: AppColor.gold,),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70.0),
          child: Text(
            arg.hadithTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: AppColor.gold,
            ),
          ),
        ),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 90,
                height: 90,
                child: Image(image: AssetImage(AppAssets.icon_Page_left)),
              ),
              Text(
                arg.hadithTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColor.gold,
                ),),
              Container(
                width: 90,
                height: 90,
                child: Image(image: AssetImage(AppAssets.icon_Page_right)),
              ),
            ],
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(children: [Text(
                arg.hadithContent,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColor.gold,
                ),
              ),],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image(image: AssetImage(AppAssets.icon_Page_bottem),),
          ),
        ],
      ),
    );
  }
}
