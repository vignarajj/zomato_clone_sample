import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zomato_clone_sample/di/constants.dart';
import 'package:zomato_clone_sample/models/GeoCodeResponse.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, dynamic> {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigatorBloc({this.navigatorKey}) : super(navigatorKey);

  @override
  dynamic get initialState => 0;

  Stream<dynamic> mapEventToState(NavigatorEvent event) async* {
    if (event is NavigateToMain) {
      navigatorKey.currentState
          .pushNamedAndRemoveUntil(mainScreen, (Route<dynamic> route) => false);
    } else if (event is NavigateToDetails) {
      NearbyRestaurant nearbyRestaurant = event.nearbyRestaurant;
      navigatorKey.currentState
          .pushNamed(detailsPage, arguments: nearbyRestaurant);
    }
  }
}

abstract class NavigatorEvent extends Equatable {
  @override
  List<Object> props = [];
}

class NavigateToMain extends NavigatorEvent {}

class NavigateToDetails extends NavigatorEvent {
  final NearbyRestaurant nearbyRestaurant;

  NavigateToDetails({this.nearbyRestaurant});
}
