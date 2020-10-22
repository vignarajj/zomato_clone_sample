import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zomato_clone_sample/di/strings.dart';
import 'package:zomato_clone_sample/models/GeoCodeResponse.dart';
import 'package:zomato_clone_sample/styles/color.dart';
import 'package:zomato_clone_sample/styles/decorations.dart';
import 'package:zomato_clone_sample/utils/sizeconfig.dart';
import 'package:zomato_clone_sample/widgets/textview.dart';

class DetailsPage extends StatefulWidget {
  final NearbyRestaurant nearbyRestaurant;
  final bool isConnected;

  DetailsPage({this.nearbyRestaurant, this.isConnected});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  NearbyRestaurant get _restaurant => widget.nearbyRestaurant;

  bool get _isConnected => widget.isConnected;

  String restaurantName = '';
  double initialRating = 0;
  String orderUrl = '';
  String menuUrl = '';

  @override
  void initState() {
    super.initState();
    restaurantName = _restaurant.restaurant.name;
    if(_restaurant.restaurant.userRating.aggregateRating!=0){
      initialRating =
          double.parse(_restaurant.restaurant.userRating.aggregateRating);
    }
    orderUrl = _restaurant.restaurant.orderUrl;
    menuUrl = _restaurant.restaurant.menuUrl;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: false,
              iconTheme: IconThemeData(color: AppColors.white),
              automaticallyImplyLeading: true,
              expandedHeight: SizeConfig.screenHeight / 3.5,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: restaurantName.length > 20 ? false : true,
                collapseMode: CollapseMode.parallax,
                background: Container(
                  decoration: bannerDecoration(
                      _restaurant.restaurant.featuredImage, _isConnected),
                ),
              ),
            ),
            SliverFillRemaining(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 5, top: 2),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: TextBold(
                          text:
                          "${_restaurant.restaurant.name}",
                          textColor: AppColors.colorPrimary,
                          textSize: SizeConfig.xxlarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    //cuisines
                    Container(
                      margin: const EdgeInsets.only(left: 5, top: 3),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: TextItalic(
                          text: _restaurant.restaurant.cuisines,
                          textColor: AppColors.colorPrimary,
                          textSize: SizeConfig.medium,
                        ),
                      ),
                    ),
                    //rating
                    Container(
                      margin: const EdgeInsets.only(left: 5, top: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              alignment: Alignment.topRight,
                              child: SmoothStarRating(
                                rating: initialRating,
                                isReadOnly: true,
                                size: 20,
                                color: Colors.yellow.shade900,
                                borderColor: Colors.yellow.shade800,
                                filledIconData: Icons.star,
                                halfFilledIconData: Icons.star_half,
                                defaultIconData: Icons.star_border,
                                starCount: 5,
                                allowHalfRating: true,
                                spacing: 1.0,
                                onRated: (value) {},
                              )),
                          Container(
                            alignment: Alignment.topCenter,
                            margin: const EdgeInsets.only(left: 10),
                            child: TextMedium(
                              text: "${_restaurant.restaurant.userRating.ratingText}",
                              textColor: AppColors.black,
                              textSize: SizeConfig.medium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //average for two
                    Container(
                      margin: const EdgeInsets.only(left: 5, top: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: TextMedium(
                          text:
                              "${_restaurant.restaurant.currency} ${_restaurant.restaurant.averageCostForTwo} /Average cost for two peoples",
                          textColor: AppColors.black,
                          textSize: SizeConfig.medium,
                        ),
                      ),
                    ),
                    //location
                    Container(
                      margin: const EdgeInsets.only(left: 5, top: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: TextRegular(
                          text: "${_restaurant.restaurant.location.address}",
                          textColor: AppColors.black,
                          textSize: SizeConfig.medium,
                        ),
                      ),
                    ),
                    menuUrl != null
                        ? Container(
                            margin: const EdgeInsets.only(left: 5, top: 15),
                            child: GestureDetector(
                              onTap: () async {
                                await launch(menuUrl);
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: TextRegular(
                                  text: Strings.click_menu,
                                  textColor: AppColors.colorBlue,
                                  textSize: SizeConfig.medium,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    orderUrl != null
                        ? Container(
                            margin: const EdgeInsets.only(left: 5, top: 10),
                            child: GestureDetector(
                              onTap: () async {
                                await launch(orderUrl);
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: TextRegular(
                                  text: Strings.click_order,
                                  textColor: AppColors.colorBlue,
                                  textSize: SizeConfig.medium,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              fillOverscroll: true,
              hasScrollBody: false,
            )
          ],
        ),
      ),
    );
  }
}
