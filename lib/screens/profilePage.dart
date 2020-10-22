import 'package:flutter/material.dart';
import 'package:zomato_clone_sample/di/strings.dart';
import 'package:zomato_clone_sample/styles/color.dart';
import 'package:zomato_clone_sample/utils/sizeconfig.dart';
import 'package:zomato_clone_sample/widgets/textview.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: TextMedium(
          text: Strings.invoice,
          textSize: SizeConfig.medium,
          textColor: Colors.black,
        ),
      ),
    );
  }
}
