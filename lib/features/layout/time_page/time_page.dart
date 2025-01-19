import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:islami/features/layout/time_page/widget/product_widget.dart';
class TimePage extends StatelessWidget {
  const TimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.background_TimePage),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image(
              image: AssetImage(AppAssets.icon_islami),
              width: 250,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              decoration: BoxDecoration(color: Color(0xff856B3F),borderRadius: BorderRadius.circular(40)),
              height: 301,
              child: Image(
              image: AssetImage(AppAssets.image_Pray_Time),
            ),
            ),
          ),
          Expanded(
            flex: 1,
            child: DynamicHeightGridView(
              builder: ((context, index){
                return ProductsWidget(id:(index+1).toString(),);
              }),
              itemCount: 16,
              crossAxisCount: 2,
            ),
          )
        ],
      ),
    ),
      ),
    );
  }
}
