import 'package:flutter/material.dart';
import 'package:zomato_clone_sample/bloc/home/home_bloc.dart';
import 'package:zomato_clone_sample/di/strings.dart';
import 'package:zomato_clone_sample/screens/homePage.dart';
import 'package:zomato_clone_sample/screens/invoicePage.dart';
import 'package:zomato_clone_sample/screens/notificationsPage.dart';
import 'package:zomato_clone_sample/screens/profilePage.dart';
import 'package:zomato_clone_sample/services/api_repository.dart';
import 'package:zomato_clone_sample/styles/color.dart';
import 'package:zomato_clone_sample/utils/sizeconfig.dart';
import 'package:zomato_clone_sample/widgets/FancyTabs.dart';

class MainPage extends StatefulWidget {
  final bool isConnected;
  final ApiRepository apiRepository;

  MainPage({this.isConnected, this.apiRepository});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  HomeBloc homeBloc;

  bool get _isConnected => widget.isConnected;

  ApiRepository get _apiRepository => widget.apiRepository;

  @override
  void initState() {
    homeBloc = HomeBloc(apiRepository: _apiRepository);
    super.initState();
  }

  List<Widget> _getChildWidgets() {
    return <Widget>[
      HomePage(
        isConnected: _isConnected,
        homeBloc: homeBloc,
      ),
      InvoicePage(),
      NotificationPage(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: FancyTabs(
          contents: _getChildWidgets(),
          initialIndex: 0,
          tabs: [
            Tab(text: Strings.home),
            Tab(text: Strings.invoice),
            Tab(
              text: Strings.notifications,
            ),
            Tab(text: Strings.profile)
          ],
          tabTextStyle: TextStyle(
              fontFamily: 'Roboto-Regular',
              fontSize: SizeConfig.small,
              color: Colors.black),
          selectedTabTextStyle: TextStyle(
              fontFamily: 'Roboto-Bold',
              fontSize: SizeConfig.small,
              color: AppColors.colorPrimary),
          tabsWidth: 64,
          indicatorWidth: 30,
          indicatorSide: IndicatorSide.end,
          indicatorColor: AppColors.colorTabBackground,
        ),
      ),
    );
  }
}
