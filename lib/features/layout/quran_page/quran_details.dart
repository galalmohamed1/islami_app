import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:islami/models/surah_data.dart';

class QuranDetails extends StatefulWidget {
  static const String routeName="QuranDetails";

   QuranDetails({super.key,});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  List<String> verseslist=[];
  @override
  Widget build(BuildContext context) {
    var arg= ModalRoute.of(context)?.settings.arguments as SurahData ;
    if(verseslist.isEmpty) LoadData(arg.id.toString());
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      appBar: AppBar(
        backgroundColor: AppColor.black,
        iconTheme: IconThemeData(color: AppColor.gold,),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70.0),
          child: Text(
            arg.nameEN,
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
                arg.nameAR,
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
              child: ListView.builder(itemBuilder: (context, index) => Text(
                "[${index+1}]${verseslist[index]}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColor.gold,
                ),
              ),
                itemCount: verseslist.length,
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

  LoadData(String id)async{
   String content=await rootBundle.loadString("assets/files/${id}.txt");
   setState(() {
     verseslist=content.split("\n");
   });
  }
}
