import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'file:///E:/Flutter%20Workspaces/Flutter_samples/zomato_clone_sample/lib/bloc/home/home_actions.dart';
import 'file:///E:/Flutter%20Workspaces/Flutter_samples/zomato_clone_sample/lib/bloc/home/home_state.dart';
import 'package:zomato_clone_sample/models/GeoCodeResponse.dart';
import 'package:zomato_clone_sample/services/api_repository.dart';

class HomeBloc extends Bloc<HomeAction, HomeState> {
  final ApiRepository apiRepository;

  HomeBloc({@required this.apiRepository}) : assert(apiRepository!=null), super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(HomeAction event) async*{
    if(event is HomeInitiated){
      if(event.isConnected){
        yield HomeLoading();
        try{
          final response = await apiRepository.getNearByRestaurants(event.latitude, event.longitude);
          if(response!=null){
            String data = response.toJson();
            var localStore = await Hive.openLazyBox('localData');
            localStore.put('nearBy', jsonEncode(data));
            yield HomeComplete(geoCode: response);
          }else{
            yield HomeError(error: 'Unable to load!');
          }
        }catch(e){
          yield HomeError(error: e.toString());
        }
      }else{
        yield HomeLoading();
        var localData = await Hive.openLazyBox('localData');
        String data = await localData.get('nearBy');
        GeoCode response = GeoCode.fromJson(jsonDecode(data));
        if(response!=null) {
          yield HomeComplete(geoCode: response);
        }else{
          yield HomeError(error: 'Unable to load!');
        }
      }
    }else if(event is ViewDetails){
      yield DetailsNavigated();
    }else if(event is UpdateUI){
      yield HomeUIUpdated();
    }
  }
}
