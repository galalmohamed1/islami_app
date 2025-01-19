import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_color.dart';

class CustomNavBarItem extends StatelessWidget {
  final int selectedindex;
  final int index;
  final String iconPath;

  const CustomNavBarItem(
      {super.key,
      required this.selectedindex,
      required this.index,
      required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: selectedindex == index
            ? AppColor.black.withOpacity(0.5)
            : Colors.transparent,
      ),
      child: ImageIcon(
        AssetImage(iconPath),
      ),
    );
  }
}
