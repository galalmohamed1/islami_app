import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:islami/features/layout/radio_page/widget/audio_of_widget.dart';
import 'package:islami/models/radio_data.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  @override
  Widget build(BuildContext context) {
    List<RadioData> items=[
      RadioData(name: "Radio Ibrahim Al-Akdar"),
      RadioData(name: "Radio Al-Qaria Yassen"),
      RadioData(name: "Radio Ahmed Al-trabulsi"),
      RadioData(name: "Radio Addokali Mohammad Alalim"),
      RadioData(name: "Radio Ibrahim Al-Akdar"),
    ];
    List<bool> isSelected=[true,false];
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(AppAssets.background_RadioPage),
        fit: BoxFit.cover,
      ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image(
                  image: AssetImage(AppAssets.icon_islami),
                  width: 250,
                ),
              ),
              ToggleButtons(
                  children: [
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 70.0),
                   child: Text(
                    "Radio",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                    ),),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 70.0),
                   child: Text(
                    "Reciters",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                    ),),
                 ),

            ],

                splashColor: AppColor.gold,
                fillColor: AppColor.gold,
                borderRadius: BorderRadius.circular(20),
                selectedColor: AppColor.black,
                color: AppColor.white,
                isSelected:isSelected ,
              onPressed:(index) {
               setState(() {
                 isSelected[index]=!isSelected[index];
               });
              },
              ),

              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Audio_Of_Widget(radioData: items[index],),
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),

                itemCount: 5,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
