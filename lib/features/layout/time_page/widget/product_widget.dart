import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_color.dart';

class ProductsWidget extends StatelessWidget {
  final String id;
  const ProductsWidget({super.key, required this.id,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color: AppColor.gold)),
          height: 259,
          width: 185,
        child: Column(
          children: [
            Image(image: AssetImage("assets/icons/Illustration (${id}).png")),
            SizedBox(height: 15,),
            Text("Evening Azkar",style: TextStyle(color: AppColor.white,fontWeight: FontWeight.w700,fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
