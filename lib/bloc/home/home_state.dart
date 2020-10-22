import 'package:equatable/equatable.dart';
import 'package:zomato_clone_sample/models/GeoCodeResponse.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> props = [];
}

class HomeInitial extends HomeState {
  @override
  String toString() => "HomeInitial";
}

class HomeLoading extends HomeState {
  @override
  String toString() => "HomeLoading";
}

class HomeError extends HomeState {
  final String error;

  HomeError({this.error});

  @override
  String toString() => "HomeError";
}

class HomeComplete extends HomeState {
  final GeoCode geoCode;
  HomeComplete({this.geoCode});
  @override
  String toString() => "HomeComplete";
}

class HomeUIUpdated extends HomeState {
  @override
  String toString() => 'HomeUIUpdated';
}

class DetailsNavigated extends HomeState {
  @override
  String toString() => "DetailsNavigation";
}
