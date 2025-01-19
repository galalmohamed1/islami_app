import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/features/layout/hadith_page/widget/hadith_details.dart';
import 'package:islami/features/layout/hadith_page/widget/hadith_item_card.dart';
import 'package:islami/models/hadith_data.dart';

class HadithPage extends StatefulWidget {
   const HadithPage({super.key});

  @override
  State<HadithPage> createState() => _HadithPageState();
}

class _HadithPageState extends State<HadithPage> {

  List<HadithData> itemslist=[];
  @override

  @override
  Widget build(BuildContext context) {
    var Index=0;
    if(itemslist.isEmpty)LoadData();
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.background_HadithPage),
              alignment: Alignment.topCenter)),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(image: AssetImage(AppAssets.icon_islami),height: 150,),
            Expanded(
              child: CarouselSlider(
                 items: itemslist.map((e) {
                   return GestureDetector(
                     onTap: () {
                       Navigator.pushNamed(context, HadithDetails.routeName,arguments: itemslist[Index]);
                     },
                     child: Hadith_Item_Card(
                       hadithData: e,
                     ),
                   );
                 },).toList(),
                 options: CarouselOptions(
                    aspectRatio: 0.5,
                    viewportFraction: 0.68,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.26,
                    onPageChanged: (index, reason) {
                      Index=index;
                    },
                    scrollDirection: Axis.horizontal,
                 )
               ),
            ),
          ],
        ),
      ),
    );
  }



  LoadData()async{
     String content=await rootBundle.loadString("assets/files/ahadeth .txt");
     List<String> HadithList=content.split("#");
     for(var element in HadithList){
       String singleHadith=element.trim();
       int index=singleHadith.indexOf("\n");
       String hadithTitle = singleHadith.substring(0,index);
       String hadithContent = singleHadith.substring(index+1);
       var hadithData= HadithData(
         hadithTitle: hadithTitle,
           hadithContent: hadithContent
       );
       itemslist.add(hadithData);
     }
     setState(() {

     });
   }
}
