import 'package:zomato_clone_sample/models/GeoCodeResponse.dart';
import 'package:zomato_clone_sample/services/api_provider.dart';

class ApiRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<GeoCode> getNearByRestaurants(double latitude, double longitude) =>
      _apiProvider.getLocationData(latitude, longitude);
}
