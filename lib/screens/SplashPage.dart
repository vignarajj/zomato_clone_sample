import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zomato_clone_sample/NavigationBloc.dart';
import 'package:zomato_clone_sample/di/strings.dart';
import 'package:zomato_clone_sample/styles/color.dart';
import 'package:zomato_clone_sample/utils/sizeconfig.dart';
import 'package:zomato_clone_sample/widgets/textview.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navigateToLandingPage() async {
    var duration = new Duration(seconds: 3);
    return Timer(duration, nextPage);
  }

  void nextPage() {
    BlocProvider.of<NavigatorBloc>(context).add(NavigateToMain());
  }

  @override
  void initState() {
    super.initState();
    navigateToLandingPage();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Material(
      child: Container(
          alignment: Alignment.center,
          color: AppColors.colorPrimaryDark,
          child: TextBold(
            text: Strings.appName,
            textSize: SizeConfig.xxlarge,
            textColor: Colors.white,
          )),
    ));
  }
}
