import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:islami/features/layout/hadith_page/hadith_page.dart';
import 'package:islami/features/layout/page/widget/custom_nav_bar_item.dart';
import 'package:islami/features/layout/quran_page/quran_page.dart';
import 'package:islami/features/layout/radio_page/radio_page.dart';
import 'package:islami/features/layout/sebha_page/sepha_page.dart';
import 'package:islami/features/layout/time_page/time_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName="HomePage";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedindex = 0;
  List<Widget> tabs = [
    QuranPage(),
    HadithPage(),
    SephaPage(),
    RadioPage(),
    TimePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          selectedindex = index;
          setState(() {});
        },
        currentIndex: selectedindex,
        backgroundColor: AppColor.gold,
        fixedColor: AppColor.white,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: CustomNavBarItem(
              selectedindex: selectedindex,
              index: 0,
              iconPath: AppAssets.icone_quran,
            ),
            label: "Quran",
          ),
          BottomNavigationBarItem(
            icon: CustomNavBarItem(
              selectedindex: selectedindex,
              index: 1,
              iconPath: AppAssets.icone_hadith,
            ),
            label: "Hadith",
          ),
          BottomNavigationBarItem(
            icon: CustomNavBarItem(
              selectedindex: selectedindex,
              index: 2,
              iconPath: AppAssets.icone_sepha,
            ),
            label: "sepha",
          ),
          BottomNavigationBarItem(
            icon: CustomNavBarItem(
              selectedindex: selectedindex,
              index: 3,
              iconPath: AppAssets.icone_radio,
            ),
            label: "Radio",
          ),
          BottomNavigationBarItem(
            icon: CustomNavBarItem(
              selectedindex: selectedindex,
              index: 4,
              iconPath: AppAssets.icone_time,
            ),
            label: "Time",
          ),
        ],
      ),
      body: tabs[selectedindex],
    );
  }
}
