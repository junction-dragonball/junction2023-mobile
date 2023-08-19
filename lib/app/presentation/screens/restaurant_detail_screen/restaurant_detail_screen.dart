import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yummy_quest/app/presentation/screens/restaurant_detail_screen/restaurant_detail_screen_controller.dart';
import 'package:yummy_quest/app/presentation/widgets/gap_layout.dart';
import 'package:yummy_quest/app/presentation/widgets/global_widget.dart';
import 'package:yummy_quest/core/themes/color_theme.dart';
import 'package:yummy_quest/core/themes/text_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class RestaurantDetailScreen extends GetView<RestaurantDetailScreenController> {
  const RestaurantDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        key: controller.scaffoldKey,
        appBar: CustomAppBar(),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Positioned.fill(
              child: SafeArea(
                bottom: false,
                child: SingleChildScrollView(
                  child: GetBuilder<RestaurantDetailScreenController>(
                      builder: (controller) {
                    return Column(children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(8, 16, 8, 24),
                          child: Hero(
                              tag: controller.restaurant.id + 'restaurant',
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          controller.restaurant.thumbnailUrl),
                                    )))),
                              ))),
                      GapRow(
                        gap: 4,
                        padding: EdgeInsets.only(left: 24),
                        children: [
                          Container(
                            child: GapRow(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 8),
                                crossAxisAlignment: CrossAxisAlignment.center,
                                gap: 4,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 16,
                                    color: MyColors.White,
                                  ),
                                  Text(
                                    controller.restaurant.rating.toString(),
                                    style: MyTextStyles.Small_w800.copyWith(
                                        color: MyColors.White),
                                  )
                                ]),
                            height: 24,
                            decoration: BoxDecoration(
                              color: MyColors.Red,
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                          ),
                          Container(
                            child: GapRow(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 8),
                                crossAxisAlignment: CrossAxisAlignment.center,
                                gap: 4,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 16,
                                    color: MyColors.Dim600,
                                  ),
                                  Text(
                                    controller.minutes.toString() + " min",
                                    style: MyTextStyles.Small_w800.copyWith(
                                        color: MyColors.Dim600),
                                  )
                                ]),
                            height: 24,
                            decoration: BoxDecoration(
                              color: MyColors.Gray100,
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      GapColumn(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                          ),
                          gap: 0,
                          children: [
                            Text(
                              controller.restaurant.name,
                              style: MyTextStyles.Giant_w800,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              controller.restaurant.name,
                              style: MyTextStyles.Medium_w400,
                            ),
                            const SizedBox(height: 24),
                            Divider(
                              thickness: 1,
                              color: MyColors.Gray100,
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Featured Plates',
                              style: MyTextStyles.Large_w600,
                            ),
                          ]),
                      const SizedBox(height: 16),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: GapRow(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              gap: 24,
                              children: [
                                ...controller.restaurant.menus
                                    .map((menu) => Container(
                                        width: 200,
                                        child: GapColumn(gap: 0, children: [
                                          Container(
                                            height: 200,
                                            width: 200,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  controller
                                                      .restaurant.thumbnailUrl,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 12),
                                          Text(menu.name,
                                              overflow: TextOverflow.ellipsis,
                                              style: MyTextStyles.Medium_w600
                                                  .copyWith(
                                                      color: MyColors.Gray900)),
                                          SizedBox(height: 4),
                                          Text(
                                              '₩ ' +
                                                  NumberFormat.decimalPattern()
                                                      .format(menu.price),
                                              style: MyTextStyles.Small_w400
                                                  .copyWith(
                                                      color: MyColors.Dim600)),
                                        ])))
                              ])),
                      GapColumn(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                          ),
                          gap: 0,
                          children: [
                            const SizedBox(height: 32),
                            Divider(
                              thickness: 1,
                              color: MyColors.Gray100,
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Location',
                              style: MyTextStyles.Large_w600,
                            ),
                            const SizedBox(height: 16),
                            Container(
                              height: 218,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    controller.restaurant.mapImageUrl,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            GestureDetector(
                                onTap: () {
                                  print(controller.restaurant.naverMapId +
                                      ' hihi');
                                  launchUrl(
                                      Uri(
                                          scheme: 'https',
                                          path: controller.restaurant.naverMapId
                                              .split('//')[1]),
                                      mode: LaunchMode.externalApplication);
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: MyColors.Dim200,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 8,
                                  ),
                                  child: Text(
                                    'Navigate to the Store',
                                    style: MyTextStyles.Medium_w600.copyWith(
                                      color: MyColors.Black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                            const SizedBox(height: 120),
                          ]),
                    ]);
                  }),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: GestureDetector(
                    onTap: () {},
                    child: SafeArea(
                      top: false,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: MyColors.Blue,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 8,
                        ),
                        child: Text(
                          'Buy Coupon',
                          style: MyTextStyles.Medium_w600.copyWith(
                            color: MyColors.White,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
