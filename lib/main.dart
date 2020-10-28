import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:zomato_clone_sample/NavigationBloc.dart';
import 'package:zomato_clone_sample/connectivity/connectivityService.dart';
import 'package:zomato_clone_sample/di/constants.dart';
import 'package:zomato_clone_sample/di/strings.dart';
import 'package:zomato_clone_sample/screens/SplashPage.dart';
import 'package:zomato_clone_sample/screens/detailsPage.dart';
import 'package:zomato_clone_sample/screens/mainPage.dart';
import 'package:zomato_clone_sample/services/api_repository.dart';

Future<void> main() async {
  final ApiRepository apiRepository = ApiRepository();
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getExternalStorageDirectory();
  var path = directory.path;
  Hive..init(path);
  runApp(MyApp(
    apiRepository: apiRepository,
  ));
}

class MyApp extends StatefulWidget {
  final ApiRepository apiRepository;

  MyApp({this.apiRepository});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ApiRepository get _apiRepository => widget.apiRepository;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  final Connectivity _connectivity = new Connectivity();
  StreamSubscription<ConnectivityResult> _connectionSubscription;
  String _connectionStatus;
  bool isConnected = false;

  @override
  void initState() {
    super.initState();
    _connectionSubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        if (result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi) {
          isConnected = true;
        } else {
          isConnected = false;
        }
        _connectionStatus = result.toString();
        print("connectivity_" + _connectionStatus);
      });
    });
  }

  @override
  void dispose() {
    _connectionSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          NavigatorBloc(navigatorKey: _navigatorKey),
      child: Provider<NetworkProvider>(
        create: (context)=> NetworkProvider(),
        child: Consumer<NetworkProvider>(
          builder: (context, status, _){
            return MaterialApp(
                builder: (context, child) {
                  return MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: child);
                },
                navigatorKey: _navigatorKey,
                title: Strings.appName,
                theme: ThemeData(
                  fontFamily: 'Roboto-Medium',
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                debugShowCheckedModeBanner: false,
                home: SplashScreen(),
                onGenerateRoute: (settings) {
                  switch (settings.name) {
                    case '/':
                      return PageTransition(
                          curve: Curves.easeInOut,
                          child: SplashScreen(),
                          type: PageTransitionType.rightToLeft);
                      break;
                    case mainScreen:
                      return PageTransition(
                          curve: Curves.easeInOut,
                          child: MainPage(
                            apiRepository: _apiRepository,
                            status: status,
                          ),
                          type: PageTransitionType.rightToLeft);
                      break;
                    case detailsPage:
                      return PageTransition(
                          curve: Curves.easeInOut,
                          child: DetailsPage(
                            status: status,
                            nearbyRestaurant: settings.arguments,
                          ),
                          type: PageTransitionType.rightToLeft);
                      break;
                    default:
                      return PageTransition(
                          curve: Curves.easeInOut,
                          child: SplashScreen(),
                          type: PageTransitionType.rightToLeft);
                      break;
                  }
                });
          },
        ),
      )

    );
  }
}
