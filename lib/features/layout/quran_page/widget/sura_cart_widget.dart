import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/models/surah_data.dart';
class SuraCartWidget extends StatelessWidget {
  final SurahData surahData;
  const SuraCartWidget({
    super.key,
    required this.surahData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
      child: Row(
        children: [
          Container(
            height: 52,
            width: 52,
            child: Stack(
              children: [
                Image(image: AssetImage(AppAssets.image_Sura_Number),
                    color: AppColor.white,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 12.0),
                  child: Text(
                    surahData.id.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: AppColor.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                surahData.nameEN,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: AppColor.white,
                ),
              ),
              SizedBox(height: 5,),
              Text(
                "${surahData.ayatCount} Verses",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: AppColor.white,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            surahData.nameAR,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColor.white,
            ),
          ),
        ],
      ),
    );
  }
}
