import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/models/hadith_data.dart';

class Hadith_Item_Card extends StatelessWidget {
  final HadithData hadithData;
  Hadith_Item_Card({super.key, required this.hadithData});

  @override
  Widget build(BuildContext context) {
    return Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppAssets.image_hadith_card),fit: BoxFit.cover),borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: 100,
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Image(image: AssetImage(AppAssets.icon_HadithCard_top_left),)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Image(image: AssetImage(AppAssets.icon_HadithCard_top_right),)),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Image(image: AssetImage(AppAssets.icon_HadithCard_bottom),),
              ),
              Padding(
                padding: const EdgeInsets.all(26.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Image(image: AssetImage(AppAssets.icon_HadithCardBackGround),),
                ),
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 60,),
                  Text(
                    hadithData.hadithTitle,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: ListView(
                        children: [
                          Text(
                            hadithData.hadithContent,
                            textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
  }


}
