import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:islami/models/radio_data.dart';

class Audio_Of_Widget extends StatelessWidget {
  final RadioData radioData;
  const Audio_Of_Widget({super.key, required this.radioData});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 133,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.gold,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Align(
            alignment: Alignment.topCenter,
              child: Text(radioData.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: 97,
            // color: Colors.white,
            child: Image(image: AssetImage(AppAssets.image_Mask_group)),
          ),
        ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 50,),
              padding: EdgeInsets.only(left: 50,bottom: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow_rounded,size: 50,),color: AppColor.black,),
                  IconButton(onPressed: () {}, icon: Icon(Icons.volume_up_rounded,size: 33,),color: AppColor.black,),
                ],
              ),
            ),
          ),
      ],),
      margin: EdgeInsets.symmetric(vertical: 5),
    );
  }
}
