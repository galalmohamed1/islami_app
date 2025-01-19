import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_color.dart';

class AnimationControl extends StatelessWidget {
  final bool active;

  const AnimationControl({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: active ? AppColor.gold : AppColor.gray,
      ),
      width: active ? 25 : 10,
      height: 10,
    );
  }
}
