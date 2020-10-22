import 'package:flutter/material.dart';
import 'package:zomato_clone_sample/di/strings.dart';
import 'package:zomato_clone_sample/styles/color.dart';
import 'package:zomato_clone_sample/utils/sizeconfig.dart';
import 'package:zomato_clone_sample/widgets/textview.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: TextMedium(
          text: Strings.notifications,
          textSize: SizeConfig.medium,
          textColor: Colors.black,
        ),
      ),
    );
  }
}
