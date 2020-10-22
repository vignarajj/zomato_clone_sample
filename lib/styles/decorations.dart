import 'package:flutter/cupertino.dart';
import 'package:zomato_clone_sample/styles/color.dart';

BoxDecoration listItemDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(24.0),
    color: const Color(0xffffffff),
    border: Border(
        top: BorderSide(width: 1, color: AppColors.colorLightGray),
        bottom: BorderSide(width: 1, color: AppColors.colorLightGray),
        right: BorderSide(width: 1, color: AppColors.colorLightGray),
        left: BorderSide(width: 1, color: AppColors.colorLightGray)),
    boxShadow: [
      BoxShadow(
        color: const Color(0x1a000000),
        offset: Offset(8, 16),
        blurRadius: 32,
      ),
    ],
  );
}

BoxDecoration thumbImageDecoration(String url, bool isConnected) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(40),
    boxShadow: [
      BoxShadow(
          color: Color(0x4c000000), blurRadius: 6.0, offset: Offset(-0.2, -0.2))
    ],
    image: (url.isNotEmpty && isConnected)
        ? DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.fill,
          )
        : DecorationImage(
            image: AssetImage("images/default_food_thumbnail.jpg"),
          ),
  );
}

BoxDecoration bannerDecoration(String url, bool isConnected){
  return BoxDecoration(
    shape: BoxShape.rectangle,
    image: (url.isNotEmpty && isConnected)
        ? DecorationImage(
      image: NetworkImage(url),
      fit: BoxFit.cover,
    )
        : DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage("images/default_foodbanner.jpg"),
    ),
  );
}
