import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:zomato_clone_sample/di/constants.dart';
import 'package:zomato_clone_sample/models/GeoCodeResponse.dart';

class ApiProvider {
  final Dio _dio = Dio();

  ApiProvider(){
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = 30000;
  }

  Future<GeoCode> getLocationData(double latitude, double longitude) async {
    try{
      final response = await _dio.get('geocode?lat=$latitude&lon=$longitude',
        options: Options(
          contentType: 'application/json',
          headers:{
            'user-key': userKey,
          }
        )
      );
      if(response.statusCode==200){
        return GeoCode.fromJson(jsonEncode(response.data));
      }else{
        return GeoCode.withError('Unable to fetch details');
      }
    }on DioError catch(error){
      return GeoCode.withError(error.message);
    }
  }
}