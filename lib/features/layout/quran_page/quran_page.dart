import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/constants/local_storage_keys.dart';
import 'package:islami/core/services/local_storage_service.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:islami/features/layout/quran_page/quran_details.dart';
import 'package:islami/features/layout/quran_page/widget/most_recently.dart';
import 'package:islami/features/layout/quran_page/widget/sura_cart_widget.dart';
import 'package:islami/models/surah_data.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({super.key});

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  late TextEditingController searchTextController;

  List<SurahData> filterlist= SurahData.Sura;
  List<SurahData> recentSuraModels = [];

  List<String> recentSuraIndexs = [];
  static List<SurahData> Sura = [
    SurahData(id: 1, nameAR: 'الفاتحه', nameEN: 'Al-Fatiha', ayatCount: 7),
    SurahData(id: 2, nameAR: 'البقرة', nameEN: 'Al-Baqarah', ayatCount: 286),
    SurahData(id: 3, nameAR: 'آل عمران', nameEN: 'Aal-E-Imran', ayatCount: 200),
    SurahData(id: 4, nameAR: 'النساء', nameEN: 'An-Nisa', ayatCount: 176),
    SurahData(id: 5, nameAR: 'المائدة', nameEN: 'Al-Maidah', ayatCount: 120),
    SurahData(id: 6, nameAR: 'الأنعام', nameEN: 'Al-Anam', ayatCount: 165),
    SurahData(id: 7, nameAR: 'الأعراف', nameEN: 'Al-Araf', ayatCount: 206),
    SurahData(id: 8, nameAR: 'الأنفال', nameEN: 'Al-Anfal', ayatCount: 75),
    SurahData(id: 9, nameAR: 'التوبة', nameEN: 'At-Tawbah', ayatCount: 129),
    SurahData(id: 10, nameAR: 'يونس', nameEN: 'Yunus', ayatCount: 109),
    SurahData(id: 11, nameAR: 'هود', nameEN: 'Hud', ayatCount: 123),
    SurahData(id: 12, nameAR: 'يوسف', nameEN: 'Yusuf', ayatCount: 111),
    SurahData(id: 13, nameAR: 'الرعد', nameEN: 'Ar-Rad', ayatCount: 43),
    SurahData(id: 14, nameAR: 'إبراهيم', nameEN: 'Ibrahim', ayatCount: 52),
    SurahData(id: 15, nameAR: 'الحجر', nameEN: 'Al-Hijr', ayatCount: 99),
    SurahData(id: 16, nameAR: 'النحل', nameEN: 'An-Nahl', ayatCount: 128),
    SurahData(id: 17, nameAR: 'الإسراء', nameEN: 'Al-Isra', ayatCount: 111),
    SurahData(id: 18, nameAR: 'الكهف', nameEN: 'Al-Kahf', ayatCount: 110),
    SurahData(id: 19, nameAR: 'مريم', nameEN: 'Maryam', ayatCount: 98),
    SurahData(id: 20, nameAR: 'طه', nameEN: 'Taha', ayatCount: 135),
    SurahData(id: 21, nameAR: 'الأنبياء', nameEN: 'Al-Anbiya', ayatCount: 112),
    SurahData(id: 22, nameAR: 'الحج', nameEN: 'Al-Hajj', ayatCount: 78),
    SurahData(id: 23, nameAR: 'المؤمنون', nameEN: 'Al-Mu`minoon', ayatCount: 118),
    SurahData(id: 24, nameAR: 'النّور', nameEN: 'An-Nur', ayatCount: 64),
    SurahData(id: 25, nameAR: 'الفرقان', nameEN: 'Al-Furqan', ayatCount: 77),
    SurahData(id: 26, nameAR: 'الشعراء', nameEN: 'Ash-Shu`ara', ayatCount: 227),
    SurahData(id: 27, nameAR: 'النّمل', nameEN: 'An-Naml', ayatCount: 93),
    SurahData(id: 28, nameAR: 'القصص', nameEN: 'Al-Qasas', ayatCount: 88),
    SurahData(id: 29, nameAR: 'العنكبوت', nameEN: 'Al-Ankaboot', ayatCount: 69),
    SurahData(id: 30, nameAR: 'الرّوم', nameEN: 'Ar-Rum', ayatCount: 60),
    SurahData(id: 31, nameAR: 'لقمان', nameEN: 'Luqman', ayatCount: 34),
    SurahData(id: 32, nameAR: 'السجدة', nameEN: 'As-Sajdah', ayatCount: 30),
    SurahData(id: 33, nameAR: 'الأحزاب', nameEN: 'Al-Ahzab', ayatCount: 73),
    SurahData(id: 34, nameAR: 'سبأ', nameEN: 'Saba', ayatCount: 54),
    SurahData(id: 35, nameAR: 'فاطر', nameEN: 'Fatir', ayatCount: 45),
    SurahData(id: 36, nameAR: 'يس', nameEN: 'Yaseen', ayatCount: 83),
    SurahData(id: 37, nameAR: 'الصافات', nameEN: 'As-Saffat', ayatCount: 182),
    SurahData(id: 38, nameAR: 'ص', nameEN: 'Saad', ayatCount: 88),
    SurahData(id: 39, nameAR: 'الزمر', nameEN: 'Az-Zumar', ayatCount: 75),
    SurahData(id: 40, nameAR: 'غافر', nameEN: 'Ghafir', ayatCount: 85),
    SurahData(id: 41, nameAR: 'فصّلت', nameEN: 'Fussilat', ayatCount: 54),
    SurahData(id: 42, nameAR: 'الشورى', nameEN: 'Ash-Shura', ayatCount: 53),
    SurahData(id: 43, nameAR: 'الزخرف', nameEN: 'Az-Zukhruf', ayatCount: 89),
    SurahData(id: 44, nameAR: 'الدّخان', nameEN: 'Ad-Dukhan', ayatCount: 59),
    SurahData(id: 45, nameAR: 'الجاثية', nameEN: 'Al-Jathiya', ayatCount: 37),
    SurahData(id: 46, nameAR: 'الأحقاف', nameEN: 'Al-Ahqaf', ayatCount: 35),
    SurahData(id: 47, nameAR: 'محمد', nameEN: 'Mohammed', ayatCount: 38),
    SurahData(id: 48, nameAR: 'الفتح', nameEN: 'Al-Fath', ayatCount: 29),
    SurahData(id: 49, nameAR: 'الحجرات', nameEN: 'Al-Hujurat', ayatCount: 18),
    SurahData(id: 50, nameAR: 'ق', nameEN: 'Qaf', ayatCount: 45),
    SurahData(id: 51, nameAR: 'الذاريات', nameEN: 'Adh-Dhariyat', ayatCount: 60),
    SurahData(id: 52, nameAR: 'الطور', nameEN: 'At-Tur', ayatCount: 49),
    SurahData(id: 53, nameAR: 'النجم', nameEN: 'An-Najm', ayatCount: 62),
    SurahData(id: 54, nameAR: 'القمر', nameEN: 'Al-Qamar', ayatCount: 55),
    SurahData(id: 55, nameAR: 'الرحمن', nameEN: 'Ar-Rahman', ayatCount: 78),
    SurahData(id: 56, nameAR: 'الواقعة', nameEN: 'Al-Waqi`ah', ayatCount: 96),
    SurahData(id: 57, nameAR: 'الحديد', nameEN: 'Al-Hadid', ayatCount: 29),
    SurahData(id: 58, nameAR: 'المجادلة', nameEN: 'Al-Mujadilah', ayatCount: 22),
    SurahData(id: 59, nameAR: 'الحشر', nameEN: 'Al-Hashr', ayatCount: 24),
    SurahData(id: 60, nameAR: 'الممتحنة', nameEN: 'Al-Mumtahanah', ayatCount: 13),
    SurahData(id: 61, nameAR: 'الصف', nameEN: 'Al-Saff', ayatCount: 14),
    SurahData(id: 62, nameAR: 'الجمعة', nameEN: 'Al-Jumu`ah', ayatCount: 11),
    SurahData(id: 63, nameAR: 'المنافقون', nameEN: 'Al-Munafiqun', ayatCount: 11),
    SurahData(id: 64, nameAR: 'التغابن', nameEN: 'Al-Taghabun', ayatCount: 18),
    SurahData(id: 65, nameAR: 'الطلاق', nameEN: 'At-Talaq', ayatCount: 12),
    SurahData(id: 66, nameAR: 'التحريم', nameEN: 'At-Tahrim', ayatCount: 12),
    SurahData(id: 67, nameAR: 'الملك', nameEN: 'Al-Mulk', ayatCount: 30),
    SurahData(id: 68, nameAR: 'القلم', nameEN: 'Al-Qalam', ayatCount: 52),
    SurahData(id: 69, nameAR: 'الحاقة', nameEN: 'Al-Haqqah', ayatCount: 44),
    SurahData(id: 70, nameAR: 'المعارج', nameEN: 'Al-Ma`arij', ayatCount: 28),
    SurahData(id: 71, nameAR: 'نوح', nameEN: 'Noah', ayatCount: 28),
    SurahData(id: 72, nameAR: 'الجن', nameEN: 'Al-Jinn', ayatCount: 20),
    SurahData(id: 73, nameAR: 'المزّمّل', nameEN: 'Al-Muzzammil', ayatCount: 19),
    SurahData(id: 74, nameAR: 'المدّثر', nameEN: 'Al-Muddaththir', ayatCount: 56),
    SurahData(id: 75, nameAR: 'القيامة', nameEN: 'Al-Qiyamah', ayatCount: 40),
    SurahData(id: 76, nameAR: 'الإنسان', nameEN: 'Al-Insan', ayatCount: 31),
    SurahData(id: 77, nameAR: 'المرسلات', nameEN: 'Al-Mursalat', ayatCount: 50),
    SurahData(id: 78, nameAR: 'النبأ', nameEN: 'Al-Naba', ayatCount: 40),
    SurahData(id: 79, nameAR: 'النازعات', nameEN: 'Al-Nazi`at', ayatCount: 46),
    SurahData(id: 80, nameAR: 'عبس', nameEN: 'Abasa', ayatCount: 42),
    SurahData(id: 81, nameAR: 'التكوير', nameEN: 'At-Takwir', ayatCount: 29),
    SurahData(id: 82, nameAR: 'الإنفطار', nameEN: 'Al-Infitar', ayatCount: 19),
    SurahData(id: 83, nameAR: 'المطفّفين', nameEN: 'Al-Mutaffifin', ayatCount: 36),
    SurahData(id: 84, nameAR: 'الإنشقاق', nameEN: 'Al-Inshiqaq', ayatCount: 25),
    SurahData(id: 85, nameAR: 'البروج', nameEN: 'Al-Buruj', ayatCount: 22),
    SurahData(id: 86, nameAR: 'الطارق', nameEN: 'At-Tariq', ayatCount: 17),
    SurahData(id: 87, nameAR: 'الأعلى', nameEN: 'Al-A`la', ayatCount: 19),
    SurahData(id: 88, nameAR: 'الغاشية', nameEN: 'Al-Ghashiyah', ayatCount: 26),
    SurahData(id: 89, nameAR: 'الفجر', nameEN: 'Al-Fajr', ayatCount: 30),
    SurahData(id: 90, nameAR: 'البلد', nameEN: 'Al-Balad', ayatCount: 20),
    SurahData(id: 91, nameAR: 'الشمس', nameEN: 'Ash-Shams', ayatCount: 15),
    SurahData(id: 92, nameAR: 'الليل', nameEN: 'Al-Layl', ayatCount: 21),
    SurahData(id: 93, nameAR: 'الضحى', nameEN: 'Ad-Duha', ayatCount: 11),
    SurahData(id: 94, nameAR: 'الشرح', nameEN: 'Al-Sharh', ayatCount: 8),
    SurahData(id: 95, nameAR: 'التين', nameEN: 'At-Tin', ayatCount: 8),
    SurahData(id: 96, nameAR: 'العلق', nameEN: 'Al-Alaq', ayatCount: 19),
    SurahData(id: 97, nameAR: 'القدر', nameEN: 'Al-Qadr', ayatCount: 5),
    SurahData(id: 98, nameAR: 'البينة', nameEN: 'Al-Bayyinah', ayatCount: 8),
    SurahData(id: 99, nameAR: 'الزلزلة', nameEN: 'Al-Zalzalah', ayatCount: 8),
    SurahData(id: 100, nameAR: 'العاديات', nameEN: 'Al-Adiyat', ayatCount: 11),
    SurahData(id: 101, nameAR: 'القارعة', nameEN: 'Al-Qari`ah', ayatCount: 9),
    SurahData(id: 102, nameAR: 'التكاثر', nameEN: 'Al-Takathur', ayatCount: 8),
    SurahData(id: 103, nameAR: 'العصر', nameEN: 'Al-`Asr', ayatCount: 3),
    SurahData(id: 104, nameAR: 'الهمزة', nameEN: 'Al-Hamzah', ayatCount: 9),
    SurahData(id: 105, nameAR: 'الفيل', nameEN: 'Al-Fil', ayatCount: 5),
    SurahData(id: 106, nameAR: 'قريش', nameEN: 'Quraish', ayatCount: 4),
    SurahData(id: 107, nameAR: 'الماعون', nameEN: 'Al-Ma`un', ayatCount: 7),
    SurahData(id: 108, nameAR: 'الكوثر', nameEN: 'Al-Kawthar', ayatCount: 3),
    SurahData(id: 109, nameAR: 'الكافرون', nameEN: 'Al-Kafirun', ayatCount: 6),
    SurahData(id: 110, nameAR: 'النصر', nameEN: 'An-Nasr', ayatCount: 3),
    SurahData(id: 111, nameAR: 'المسد', nameEN: 'Al-Masad', ayatCount: 5),
    SurahData(id: 112, nameAR: 'الإخلاص', nameEN: 'Al-Ikhlas', ayatCount: 4),
    SurahData(id: 113, nameAR: 'الفلق', nameEN: 'Al-Falaq', ayatCount: 5),
    SurahData(id: 114, nameAR: 'الناس', nameEN: 'An-Nas', ayatCount: 6),
  ];

  String searchtext='';
  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
    _loadRecentSura();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(image:AssetImage(
            AppAssets.background_QuranPage),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
        ),
         SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      image: AssetImage(AppAssets.icon_islami),
                      width: 250,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      cursorColor: AppColor.gold,
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                      ),
                      onChanged: (text) {
                        searchtext = text;
                        filterlist= SurahData.Sura.where((surahData) {
                          return surahData.nameAR.contains(searchtext) ||
                              surahData.nameEN.toUpperCase().contains(searchtext.toUpperCase());
                        }).toList();
                        setState(() {

                        });
                      },
                      decoration: InputDecoration(
                        fillColor: AppColor.black.withOpacity(0.5),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColor.gold),
                          ),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                          borderSide:
                          BorderSide(color: AppColor.gold),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ImageIcon(
                            AssetImage(AppAssets.icone_quran),
                            color: AppColor.gold,
                          ),
                        ),
                        hintText: "Sura Name",
                        hintStyle: TextStyle(
                            color: AppColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding:  EdgeInsets.only(top: 20.0, left: 20),
                    child:  Text(
                      "Most Recently",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 160,
                    child: Visibility(
                      visible: recentSuraModels.isNotEmpty,
                      replacement: Center(
                        child: Text(
                          "No Recent Sura",
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: AppColor.gold,
                          ),
                        ),
                      ),
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              QuranDetails.routeName,
                              arguments: recentSuraModels[index],
                            );
                          },
                          child: RecentlyScreen(

                            recentlyData: recentSuraModels[index],
                          ),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          width: 1,
                        ),

                        itemCount: recentSuraModels.length,
                      ),
                    ),
                  ),

                  const Padding(
                    padding:  EdgeInsets.only(top: 5.0, left: 20),
                    child: Text(
                      "Suras List",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => _onSuraTab(Sura[index].id-1),
                        child: SuraCartWidget(
                          surahData: filterlist[index],
                        ),
                      ) ,
                      separatorBuilder: (context, index) => Divider(
                        color: AppColor.white,
                          indent: 56,
                          endIndent: 60,
                      ),
                      itemCount: filterlist.length,
                  ),
                ],
              ),
            ),
          ),

      ],
    );
  }

  _onSuraTab(int index) {
    _cacheSura(index);
      Navigator.pushNamed(context,
        QuranDetails.routeName,
        arguments: Sura[index],
      );


  }

  _cacheSura(int index) async {
    var indexString = index.toString();

    if (recentSuraIndexs.contains(indexString)) return;

    if (recentSuraIndexs.length == 5) {
      recentSuraIndexs.removeLast();
    }
    recentSuraIndexs.insert(0, indexString);

    await LocalStorageService.setList(
      LocalStorageKeys.recentSuras,
      recentSuraIndexs,
    );
    _loadRecentSura();
    setState(() {

    });
  }

  _loadRecentSura() {
    recentSuraIndexs = [];
    recentSuraModels = [];

    recentSuraIndexs =
        LocalStorageService.getStringList(LocalStorageKeys.recentSuras) ?? [];

    for (var index in recentSuraIndexs) {
      var indexInt = int.parse(index);
      recentSuraModels.add(Sura[indexInt]);
    }

  }

}
