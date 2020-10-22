import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class HomeAction extends Equatable{
  @override
  List<Object> props = [];
}

class HomeInitiated extends HomeAction {
  final bool isConnected;
  final double latitude;
  final double longitude;

  HomeInitiated({@required this.isConnected, this.latitude, this.longitude});

  @override
  String toString() => 'HomeInitiated';
}

class HomePullToRefresh extends HomeAction {
  @override
  String toString() => 'HomePullToRefresh';
}

class ViewDetails extends HomeAction {
  @override
  String toString() => 'ViewDetails';
}

class UpdateUI extends HomeAction {
  @override
  String toString() => 'ViewDetails';
}