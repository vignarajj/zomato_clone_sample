import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:zomato_clone_sample/NavigationBloc.dart';
import 'package:zomato_clone_sample/bloc/home/home_bloc.dart';
import 'file:///E:/Flutter%20Workspaces/Flutter_samples/zomato_clone_sample/lib/bloc/home/home_actions.dart';
import 'file:///E:/Flutter%20Workspaces/Flutter_samples/zomato_clone_sample/lib/bloc/home/home_state.dart';
import 'package:zomato_clone_sample/di/strings.dart';
import 'package:zomato_clone_sample/models/GeoCodeResponse.dart';
import 'package:zomato_clone_sample/styles/color.dart';
import 'package:zomato_clone_sample/styles/decorations.dart';
import 'package:zomato_clone_sample/utils/sizeconfig.dart';
import 'package:zomato_clone_sample/widgets/textview.dart';

class HomePage extends StatefulWidget {
  final bool isConnected;
  final HomeBloc homeBloc;

  HomePage({this.isConnected, this.homeBloc});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GeoCode localData;
  List<String> topCuisines = [];
  List<NearbyRestaurant> nearByList = [];

  HomeBloc get _homeBloc => widget.homeBloc;

  bool get _isConnected => widget.isConnected;

  @override
  void initState() {
    super.initState();
    if (_isConnected) {
      checkPermission();
    } else {
      _homeBloc.add(HomeInitiated(isConnected: false));
    }
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  void localLoading() async {
    String data = await rootBundle.loadString('assets/geoLocation.json');
    localData = GeoCode.fromJson(data);
    setState(() {
      topCuisines = localData.popularity.topCuisines;
      nearByList = localData.nearbyRestaurants;
    });
    print("topCuisines ${topCuisines.length}");
  }

  void checkPermission() async {
    var status = await Permission.location.status;
    if (status.isUndetermined) {
      final permissionStatus = await Permission.location.request();
      if (permissionStatus.isGranted) {
        _getCurrentLocation();
      } else {}
    } else if (status.isGranted) {
      _getCurrentLocation();
    } else {
      Fluttertoast.showToast(msg: Strings.locationError);
    }
  }

  void _getCurrentLocation() async {
    final position = await GeolocatorPlatform.instance
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final lastPosition =
        await GeolocatorPlatform.instance.getLastKnownPosition();
    print("last Position = ${lastPosition}");
    if (position != null &&
        position.latitude != 0.0 &&
        position.longitude != 0.0) {
      setState(() {
        String _locationMessage =
            "${position.latitude} , ${position.longitude}";
        print("currentLocation $_locationMessage");
        _homeBloc.add(HomeInitiated(
            isConnected: _isConnected,
            latitude: position.latitude,
            longitude: position.longitude));
      });
    } else {
      if (lastPosition != null) {
        _homeBloc.add(HomeInitiated(
            isConnected: _isConnected,
            latitude: lastPosition.latitude,
            longitude: lastPosition.longitude));
      }else{
        Fluttertoast.showToast(msg: Strings.locationError);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        cubit: _homeBloc,
        builder: (BuildContext context, HomeState state) {
          if (state is HomeError) {
            _onWidgetDidBuild(() {
              setState(() {
                Fluttertoast.showToast(msg: state.error);
              });
              print("Error ${state.error}");
              _homeBloc.add(UpdateUI());
            });
          } else if (state is HomeComplete) {
            _onWidgetDidBuild(() {
              if (state.geoCode != null) {
                setState(() {
                  topCuisines = state.geoCode.popularity.topCuisines;
                  nearByList = state.geoCode.nearbyRestaurants;
                });
              }
            });
          }
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: state is HomeLoading
                  ? Container(
                      height: SizeConfig.screenHeight,
                      child: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: AppColors.colorLightGray,
                        ),
                      ),
                    )
                  : Container(
                      child: Column(
                        children: [
                          //title
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 20),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: TextMedium(
                                text: Strings.foodDelivery,
                                textColor: Colors.black,
                                textSize: SizeConfig.xlarge,
                              ),
                            ),
                          ),
                          //tagged list
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 25.0),
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: (topCuisines != null &&
                                    topCuisines.length > 0)
                                ? ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: topCuisines.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        child: MaterialButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.0)),
                                          onPressed: () {},
                                          color: AppColors.colorPrimary,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: TextRegular(
                                              textColor: Colors.white,
                                              text: topCuisines[index],
                                              textSize: SizeConfig.small,
                                            ),
                                          ),
                                        ),
                                      );
                                    })
                                : Container(),
                          ),
                          // near by label
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 5),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: TextBold(
                                text: Strings.nearBy,
                                textSize: SizeConfig.medium,
                                textColor: Colors.black,
                              ),
                            ),
                          ),
                          //near by list
                          Container(
                            // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                            margin: EdgeInsets.only(top: 10, bottom: 10,),
                            height: 250,
                            child: ListContainer(
                              homeBloc: _homeBloc,
                              nearbyRestaurant: nearByList,
                              isConnected: _isConnected,
                            ),
                          )
                        ],
                      ),
                    ),
            ),
          );
        });
  }
}

class ListContainer extends StatefulWidget {
  final HomeBloc homeBloc;
  final bool isConnected;
  final List<NearbyRestaurant> nearbyRestaurant;

  ListContainer(
      {this.homeBloc,
      this.isConnected,
      this.nearbyRestaurant});

  @override
  _ListContainerState createState() => _ListContainerState();
}

class _ListContainerState extends State<ListContainer> {
  HomeBloc get _homeBloc => widget.homeBloc;

  List<NearbyRestaurant> get _nearByRestaurants => widget.nearbyRestaurant;

  bool get _isConnected => widget.isConnected;

  @override
  Widget build(BuildContext context) {
    return _nearByRestaurants.length > 0
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: _nearByRestaurants.length,
            itemBuilder: (BuildContext context, int index) {
              NearbyRestaurant restaurant = _nearByRestaurants[index];
              return GestureDetector(
                onTap: (){
                  _homeBloc.add(ViewDetails());
                  BlocProvider.of<NavigatorBloc>(context).add(
                      NavigateToDetails(nearbyRestaurant: restaurant));
                },
                child: Container(
                  width: 210,
                  margin: EdgeInsets.only(left: 5, top: 5),
                  child: Stack(
                    children: [
                      Container(
                        width: 180,
                        height: 180,
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 20, top: 20, bottom: 5, right: 5),
                          decoration: listItemDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset('images/like_unselected.png'),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, top: 5),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: TextBold(
                                            text:
                                                '${restaurant.restaurant.currency} '
                                                '${restaurant.restaurant.averageCostForTwo}',
                                            textColor: AppColors.colorPrimary,
                                            textSize: SizeConfig.small,
                                          ),
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2, left: 8),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: TextMedium(
                                            text:
                                                '${restaurant.restaurant.name} ',
                                            textColor: Colors.black,
                                            textSize: SizeConfig.small,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, top: 2, bottom: 10),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: TextItalic(
                                            text:
                                                '${restaurant.restaurant.cuisines} ',
                                            textColor:
                                                AppColors.colorPrimaryDark,
                                            textSize: SizeConfig.small,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          decoration: thumbImageDecoration(
                              restaurant.restaurant.thumb, _isConnected),
                          width: 75,
                          height: 75,
                        ),
                      )
                    ],
                  ),
                ),
              );
            })
        : Container(
            child: Center(
              child: TextMedium(
                text: 'No restaurants available near your location!',
                textColor: AppColors.black,
                textSize: SizeConfig.medium,
              ),
            ),
          );
  }
}
