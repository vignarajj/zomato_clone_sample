// To parse this JSON data, do
//
//     final geoCode = geoCodeFromMap(jsonString);

import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class GeoCode {
  GeoCodeLocation location;
  Popularity popularity;
  String link;
  List<NearbyRestaurant> nearbyRestaurants;
  @JsonKey(ignore: true)
  String error;
  GeoCode({
    this.location,
    this.popularity,
    this.link,
    this.nearbyRestaurants,
  });

  GeoCode.withError(this.error);

  GeoCode copyWith({
    GeoCodeLocation location,
    Popularity popularity,
    String link,
    List<NearbyRestaurant> nearbyRestaurants,
  }) =>
      GeoCode(
        location: location ?? this.location,
        popularity: popularity ?? this.popularity,
        link: link ?? this.link,
        nearbyRestaurants: nearbyRestaurants ?? this.nearbyRestaurants,
      );

  factory GeoCode.fromJson(String str) => GeoCode.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GeoCode.fromMap(Map<String, dynamic> json) => GeoCode(
    location: GeoCodeLocation.fromMap(json["location"]),
    popularity: Popularity.fromMap(json["popularity"]),
    link: json["link"],
    nearbyRestaurants: List<NearbyRestaurant>.from(json["nearby_restaurants"].map((x) => NearbyRestaurant.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "location": location.toMap(),
    "popularity": popularity.toMap(),
    "link": link,
    "nearby_restaurants": List<dynamic>.from(nearbyRestaurants.map((x) => x.toMap())),
  };
}

class GeoCodeLocation {
  GeoCodeLocation({
    this.entityType,
    this.entityId,
    this.title,
    this.latitude,
    this.longitude,
    this.cityId,
    this.cityName,
    this.countryId,
    this.countryName,
  });

  final String entityType;
  final int entityId;
  final String title;
  final String latitude;
  final String longitude;
  final int cityId;
  final String cityName;
  final int countryId;
  final String countryName;

  GeoCodeLocation copyWith({
    String entityType,
    int entityId,
    String title,
    String latitude,
    String longitude,
    int cityId,
    String cityName,
    int countryId,
    String countryName,
  }) =>
      GeoCodeLocation(
        entityType: entityType ?? this.entityType,
        entityId: entityId ?? this.entityId,
        title: title ?? this.title,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        cityId: cityId ?? this.cityId,
        cityName: cityName ?? this.cityName,
        countryId: countryId ?? this.countryId,
        countryName: countryName ?? this.countryName,
      );

  factory GeoCodeLocation.fromJson(String str) => GeoCodeLocation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GeoCodeLocation.fromMap(Map<String, dynamic> json) => GeoCodeLocation(
    entityType: json["entity_type"],
    entityId: json["entity_id"],
    title: json["title"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    cityId: json["city_id"],
    cityName: json["city_name"],
    countryId: json["country_id"],
    countryName: json["country_name"],
  );

  Map<String, dynamic> toMap() => {
    "entity_type": entityType,
    "entity_id": entityId,
    "title": title,
    "latitude": latitude,
    "longitude": longitude,
    "city_id": cityId,
    "city_name": cityName,
    "country_id": countryId,
    "country_name": countryName,
  };
}

class NearbyRestaurant {
  NearbyRestaurant({
    this.restaurant,
  });

  final Restaurant restaurant;

  NearbyRestaurant copyWith({
    Restaurant restaurant,
  }) =>
      NearbyRestaurant(
        restaurant: restaurant ?? this.restaurant,
      );

  factory NearbyRestaurant.fromJson(String str) => NearbyRestaurant.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NearbyRestaurant.fromMap(Map<String, dynamic> json) => NearbyRestaurant(
    restaurant: Restaurant.fromMap(json["restaurant"]),
  );

  Map<String, dynamic> toMap() => {
    "restaurant": restaurant.toMap(),
  };
}

class Restaurant {
  Restaurant({
    this.r,
    this.apikey,
    this.id,
    this.name,
    this.url,
    this.location,
    this.switchToOrderMenu,
    this.cuisines,
    this.averageCostForTwo,
    this.priceRange,
    this.currency,
    this.offers,
    this.opentableSupport,
    this.isZomatoBookRes,
    this.mezzoProvider,
    this.isBookFormWebView,
    this.bookFormWebViewUrl,
    this.bookAgainUrl,
    this.thumb,
    this.userRating,
    this.photosUrl,
    this.menuUrl,
    this.featuredImage,
    this.hasOnlineDelivery,
    this.isDeliveringNow,
    this.storeType,
    this.includeBogoOffers,
    this.deeplink,
    this.isTableReservationSupported,
    this.hasTableBooking,
    this.eventsUrl,
    this.orderUrl,
    this.orderDeeplink,
  });

  final R r;
  final String apikey;
  final String id;
  final String name;
  final String url;
  final RestaurantLocation location;
  final int switchToOrderMenu;
  final String cuisines;
  final int averageCostForTwo;
  final int priceRange;
  final String currency;
  final List<dynamic> offers;
  final int opentableSupport;
  final int isZomatoBookRes;
  final String mezzoProvider;
  final int isBookFormWebView;
  final String bookFormWebViewUrl;
  final String bookAgainUrl;
  final String thumb;
  final UserRating userRating;
  final String photosUrl;
  final String menuUrl;
  final String featuredImage;
  final int hasOnlineDelivery;
  final int isDeliveringNow;
  final String storeType;
  final bool includeBogoOffers;
  final String deeplink;
  final int isTableReservationSupported;
  final int hasTableBooking;
  final String eventsUrl;
  final String orderUrl;
  final String orderDeeplink;

  Restaurant copyWith({
    R r,
    String apikey,
    String id,
    String name,
    String url,
    RestaurantLocation location,
    int switchToOrderMenu,
    String cuisines,
    int averageCostForTwo,
    int priceRange,
    String currency,
    List<dynamic> offers,
    int opentableSupport,
    int isZomatoBookRes,
    String mezzoProvider,
    int isBookFormWebView,
    String bookFormWebViewUrl,
    String bookAgainUrl,
    String thumb,
    UserRating userRating,
    String photosUrl,
    String menuUrl,
    String featuredImage,
    int hasOnlineDelivery,
    int isDeliveringNow,
    String storeType,
    bool includeBogoOffers,
    String deeplink,
    int isTableReservationSupported,
    int hasTableBooking,
    String eventsUrl,
    String orderUrl,
    String orderDeeplink,
  }) =>
      Restaurant(
        r: r ?? this.r,
        apikey: apikey ?? this.apikey,
        id: id ?? this.id,
        name: name ?? this.name,
        url: url ?? this.url,
        location: location ?? this.location,
        switchToOrderMenu: switchToOrderMenu ?? this.switchToOrderMenu,
        cuisines: cuisines ?? this.cuisines,
        averageCostForTwo: averageCostForTwo ?? this.averageCostForTwo,
        priceRange: priceRange ?? this.priceRange,
        currency: currency ?? this.currency,
        offers: offers ?? this.offers,
        opentableSupport: opentableSupport ?? this.opentableSupport,
        isZomatoBookRes: isZomatoBookRes ?? this.isZomatoBookRes,
        mezzoProvider: mezzoProvider ?? this.mezzoProvider,
        isBookFormWebView: isBookFormWebView ?? this.isBookFormWebView,
        bookFormWebViewUrl: bookFormWebViewUrl ?? this.bookFormWebViewUrl,
        bookAgainUrl: bookAgainUrl ?? this.bookAgainUrl,
        thumb: thumb ?? this.thumb,
        userRating: userRating ?? this.userRating,
        photosUrl: photosUrl ?? this.photosUrl,
        menuUrl: menuUrl ?? this.menuUrl,
        featuredImage: featuredImage ?? this.featuredImage,
        hasOnlineDelivery: hasOnlineDelivery ?? this.hasOnlineDelivery,
        isDeliveringNow: isDeliveringNow ?? this.isDeliveringNow,
        storeType: storeType ?? this.storeType,
        includeBogoOffers: includeBogoOffers ?? this.includeBogoOffers,
        deeplink: deeplink ?? this.deeplink,
        isTableReservationSupported: isTableReservationSupported ?? this.isTableReservationSupported,
        hasTableBooking: hasTableBooking ?? this.hasTableBooking,
        eventsUrl: eventsUrl ?? this.eventsUrl,
        orderUrl: orderUrl ?? this.orderUrl,
        orderDeeplink: orderDeeplink ?? this.orderDeeplink,
      );

  factory Restaurant.fromJson(String str) => Restaurant.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Restaurant.fromMap(Map<String, dynamic> json) => Restaurant(
    r: R.fromMap(json["R"]),
    apikey: json["apikey"],
    id: json["id"],
    name: json["name"],
    url: json["url"],
    location: RestaurantLocation.fromMap(json["location"]),
    switchToOrderMenu: json["switch_to_order_menu"],
    cuisines: json["cuisines"],
    averageCostForTwo: json["average_cost_for_two"],
    priceRange: json["price_range"],
    currency: json["currency"],
    offers: List<dynamic>.from(json["offers"].map((x) => x)),
    opentableSupport: json["opentable_support"],
    isZomatoBookRes: json["is_zomato_book_res"],
    mezzoProvider: json["mezzo_provider"],
    isBookFormWebView: json["is_book_form_web_view"],
    bookFormWebViewUrl: json["book_form_web_view_url"],
    bookAgainUrl: json["book_again_url"],
    thumb: json["thumb"],
    userRating: UserRating.fromMap(json["user_rating"]),
    photosUrl: json["photos_url"],
    menuUrl: json["menu_url"],
    featuredImage: json["featured_image"],
    hasOnlineDelivery: json["has_online_delivery"],
    isDeliveringNow: json["is_delivering_now"],
    storeType: json["store_type"],
    includeBogoOffers: json["include_bogo_offers"],
    deeplink: json["deeplink"],
    isTableReservationSupported: json["is_table_reservation_supported"],
    hasTableBooking: json["has_table_booking"],
    eventsUrl: json["events_url"],
    orderUrl: json["order_url"] == null ? null : json["order_url"],
    orderDeeplink: json["order_deeplink"] == null ? null : json["order_deeplink"],
  );

  Map<String, dynamic> toMap() => {
    "R": r.toMap(),
    "apikey": apikey,
    "id": id,
    "name": name,
    "url": url,
    "location": location.toMap(),
    "switch_to_order_menu": switchToOrderMenu,
    "cuisines": cuisines,
    "average_cost_for_two": averageCostForTwo,
    "price_range": priceRange,
    "currency": currency,
    "offers": List<dynamic>.from(offers.map((x) => x)),
    "opentable_support": opentableSupport,
    "is_zomato_book_res": isZomatoBookRes,
    "mezzo_provider": mezzoProvider,
    "is_book_form_web_view": isBookFormWebView,
    "book_form_web_view_url": bookFormWebViewUrl,
    "book_again_url": bookAgainUrl,
    "thumb": thumb,
    "user_rating": userRating.toMap(),
    "photos_url": photosUrl,
    "menu_url": menuUrl,
    "featured_image": featuredImage,
    "has_online_delivery": hasOnlineDelivery,
    "is_delivering_now": isDeliveringNow,
    "store_type": storeType,
    "include_bogo_offers": includeBogoOffers,
    "deeplink": deeplink,
    "is_table_reservation_supported": isTableReservationSupported,
    "has_table_booking": hasTableBooking,
    "events_url": eventsUrl,
    "order_url": orderUrl == null ? null : orderUrl,
    "order_deeplink": orderDeeplink == null ? null : orderDeeplink,
  };
}

class RestaurantLocation {
  RestaurantLocation({
    this.address,
    this.locality,
    this.city,
    this.cityId,
    this.latitude,
    this.longitude,
    this.zipcode,
    this.countryId,
    this.localityVerbose,
  });

  final String address;
  final String locality;
  final String city;
  final int cityId;
  final String latitude;
  final String longitude;
  final String zipcode;
  final int countryId;
  final String localityVerbose;

  RestaurantLocation copyWith({
    String address,
    String locality,
    String city,
    int cityId,
    String latitude,
    String longitude,
    String zipcode,
    int countryId,
    String localityVerbose,
  }) =>
      RestaurantLocation(
        address: address ?? this.address,
        locality: locality ?? this.locality,
        city: city ?? this.city,
        cityId: cityId ?? this.cityId,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        zipcode: zipcode ?? this.zipcode,
        countryId: countryId ?? this.countryId,
        localityVerbose: localityVerbose ?? this.localityVerbose,
      );

  factory RestaurantLocation.fromJson(String str) => RestaurantLocation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RestaurantLocation.fromMap(Map<String, dynamic> json) => RestaurantLocation(
    address: json["address"],
    locality: json["locality"],
    city: json["city"],
    cityId: json["city_id"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    zipcode: json["zipcode"],
    countryId: json["country_id"],
    localityVerbose: json["locality_verbose"],
  );

  Map<String, dynamic> toMap() => {
    "address": address,
    "locality": locality,
    "city": city,
    "city_id": cityId,
    "latitude": latitude,
    "longitude": longitude,
    "zipcode": zipcode,
    "country_id": countryId,
    "locality_verbose": localityVerbose,
  };
}

class R {
  R({
    this.hasMenuStatus,
    this.resId,
    this.isGroceryStore,
  });

  final HasMenuStatus hasMenuStatus;
  final int resId;
  final bool isGroceryStore;

  R copyWith({
    HasMenuStatus hasMenuStatus,
    int resId,
    bool isGroceryStore,
  }) =>
      R(
        hasMenuStatus: hasMenuStatus ?? this.hasMenuStatus,
        resId: resId ?? this.resId,
        isGroceryStore: isGroceryStore ?? this.isGroceryStore,
      );

  factory R.fromJson(String str) => R.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory R.fromMap(Map<String, dynamic> json) => R(
    hasMenuStatus: HasMenuStatus.fromMap(json["has_menu_status"]),
    resId: json["res_id"],
    isGroceryStore: json["is_grocery_store"],
  );

  Map<String, dynamic> toMap() => {
    "has_menu_status": hasMenuStatus.toMap(),
    "res_id": resId,
    "is_grocery_store": isGroceryStore,
  };
}

class HasMenuStatus {
  HasMenuStatus({
    this.delivery,
    this.takeaway,
  });

  final int delivery;
  final int takeaway;

  HasMenuStatus copyWith({
    int delivery,
    int takeaway,
  }) =>
      HasMenuStatus(
        delivery: delivery ?? this.delivery,
        takeaway: takeaway ?? this.takeaway,
      );

  factory HasMenuStatus.fromJson(String str) => HasMenuStatus.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HasMenuStatus.fromMap(Map<String, dynamic> json) => HasMenuStatus(
    delivery: json["delivery"],
    takeaway: json["takeaway"],
  );

  Map<String, dynamic> toMap() => {
    "delivery": delivery,
    "takeaway": takeaway,
  };
}

class UserRating {
  UserRating({
    this.aggregateRating,
    this.ratingText,
    this.ratingColor,
    this.ratingObj,
    this.votes,
  });

  final dynamic aggregateRating;
  final String ratingText;
  final String ratingColor;
  final RatingObj ratingObj;
  final int votes;

  UserRating copyWith({
    dynamic aggregateRating,
    String ratingText,
    String ratingColor,
    RatingObj ratingObj,
    int votes,
  }) =>
      UserRating(
        aggregateRating: aggregateRating ?? this.aggregateRating,
        ratingText: ratingText ?? this.ratingText,
        ratingColor: ratingColor ?? this.ratingColor,
        ratingObj: ratingObj ?? this.ratingObj,
        votes: votes ?? this.votes,
      );

  factory UserRating.fromJson(String str) => UserRating.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserRating.fromMap(Map<String, dynamic> json) => UserRating(
    aggregateRating: json["aggregate_rating"],
    ratingText: json["rating_text"],
    ratingColor: json["rating_color"],
    ratingObj: RatingObj.fromMap(json["rating_obj"]),
    votes: json["votes"],
  );

  Map<String, dynamic> toMap() => {
    "aggregate_rating": aggregateRating,
    "rating_text": ratingText,
    "rating_color": ratingColor,
    "rating_obj": ratingObj.toMap(),
    "votes": votes,
  };
}

class RatingObj {
  RatingObj({
    this.title,
    this.bgColor,
  });

  final Title title;
  final BgColor bgColor;

  RatingObj copyWith({
    Title title,
    BgColor bgColor,
  }) =>
      RatingObj(
        title: title ?? this.title,
        bgColor: bgColor ?? this.bgColor,
      );

  factory RatingObj.fromJson(String str) => RatingObj.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RatingObj.fromMap(Map<String, dynamic> json) => RatingObj(
    title: Title.fromMap(json["title"]),
    bgColor: BgColor.fromMap(json["bg_color"]),
  );

  Map<String, dynamic> toMap() => {
    "title": title.toMap(),
    "bg_color": bgColor.toMap(),
  };
}

class BgColor {
  BgColor({
    this.type,
    this.tint,
  });

  final String type;
  final String tint;

  BgColor copyWith({
    String type,
    String tint,
  }) =>
      BgColor(
        type: type ?? this.type,
        tint: tint ?? this.tint,
      );

  factory BgColor.fromJson(String str) => BgColor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BgColor.fromMap(Map<String, dynamic> json) => BgColor(
    type: json["type"],
    tint: json["tint"],
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "tint": tint,
  };
}

class Title {
  Title({
    this.text,
  });

  final String text;

  Title copyWith({
    String text,
  }) =>
      Title(
        text: text ?? this.text,
      );

  factory Title.fromJson(String str) => Title.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Title.fromMap(Map<String, dynamic> json) => Title(
    text: json["text"],
  );

  Map<String, dynamic> toMap() => {
    "text": text,
  };
}

class Popularity {
  Popularity({
    this.popularity,
    this.nightlifeIndex,
    this.nearbyRes,
    this.topCuisines,
    this.popularityRes,
    this.nightlifeRes,
    this.subzone,
    this.subzoneId,
    this.city,
  });

  final String popularity;
  final String nightlifeIndex;
  final List<String> nearbyRes;
  final List<String> topCuisines;
  final String popularityRes;
  final String nightlifeRes;
  final String subzone;
  final int subzoneId;
  final String city;

  Popularity copyWith({
    String popularity,
    String nightlifeIndex,
    List<String> nearbyRes,
    List<String> topCuisines,
    String popularityRes,
    String nightlifeRes,
    String subzone,
    int subzoneId,
    String city,
  }) =>
      Popularity(
        popularity: popularity ?? this.popularity,
        nightlifeIndex: nightlifeIndex ?? this.nightlifeIndex,
        nearbyRes: nearbyRes ?? this.nearbyRes,
        topCuisines: topCuisines ?? this.topCuisines,
        popularityRes: popularityRes ?? this.popularityRes,
        nightlifeRes: nightlifeRes ?? this.nightlifeRes,
        subzone: subzone ?? this.subzone,
        subzoneId: subzoneId ?? this.subzoneId,
        city: city ?? this.city,
      );

  factory Popularity.fromJson(String str) => Popularity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Popularity.fromMap(Map<String, dynamic> json) => Popularity(
    popularity: json["popularity"],
    nightlifeIndex: json["nightlife_index"],
    nearbyRes: List<String>.from(json["nearby_res"].map((x) => x)),
    topCuisines: List<String>.from(json["top_cuisines"].map((x) => x)),
    popularityRes: json["popularity_res"],
    nightlifeRes: json["nightlife_res"],
    subzone: json["subzone"],
    subzoneId: json["subzone_id"],
    city: json["city"],
  );

  Map<String, dynamic> toMap() => {
    "popularity": popularity,
    "nightlife_index": nightlifeIndex,
    "nearby_res": List<dynamic>.from(nearbyRes.map((x) => x)),
    "top_cuisines": List<dynamic>.from(topCuisines.map((x) => x)),
    "popularity_res": popularityRes,
    "nightlife_res": nightlifeRes,
    "subzone": subzone,
    "subzone_id": subzoneId,
    "city": city,
  };
}
