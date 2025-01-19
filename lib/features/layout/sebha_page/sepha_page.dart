import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
class SephaPage extends StatefulWidget {
  const SephaPage({super.key});

  @override
  State<SephaPage> createState() => _SephaPageState();
}

class _SephaPageState extends State<SephaPage> {
  int _counter=0;
  int _index=0;
  double _angle=0;
  List<String> list=[
    "سبحان الله",
    "الحمدلله",
    "لا الله الا الله",
    "الله اكبر",
    "اللهم صلي علي محمد",
  ];
  @override
  Widget build(BuildContext context) {

    return Stack(
        children: [
          Image(
            image:AssetImage(AppAssets.background_SephaPage),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
    ),
    SafeArea(
      child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
                child: Image(image: AssetImage(AppAssets.icon_islami),height: 171),),
            Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: AppColor.white),
            ),

            Expanded(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                              width: 80,
                              height: 86,
                              padding: EdgeInsets.only(left: 6),
                              child: Image(image: AssetImage(AppAssets.image_SebhaBody1),)),
                        ),
                        GestureDetector(
                          onTap: () {
                            _incrementCounter();
                          },
                          child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              padding: EdgeInsets.only(bottom: 20),
                              child:
                              Transform.rotate(
                                angle: _angle,
                                  child: Image(image: AssetImage(AppAssets.image_SebhaBody),fit: BoxFit.fitWidth,))),
                        ),
                        Container(
                          width: double.infinity,

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                list[_index],
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: AppColor.white),
                              ),
                              Text(
                                '$_counter',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 36,fontWeight: FontWeight.w700,color: AppColor.white),

                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
    ),
    ],
    );

  }
  void _incrementCounter() {
    setState(() {
      _counter++;
      _angle-=20;
      if(_index<=list.length) {
        if (_counter == 33) {
          _counter = 0;
          _index++;
          if(_index==list.length){
            _index=0;
          }
        }
      }

    });
  }

}
