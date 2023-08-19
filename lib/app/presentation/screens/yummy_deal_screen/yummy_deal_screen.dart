import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yummy_quest/app/presentation/widgets/gap_layout.dart';
import 'package:yummy_quest/core/themes/color_theme.dart';
import 'package:yummy_quest/core/themes/text_theme.dart';
import 'package:yummy_quest/pixels/elements/icon.dart';
import 'package:yummy_quest/pixels/styles/color.dart';

import 'yummy_deal_screen_controller.dart';

class YummyDealScreen extends GetView<YummyDealScreenController> {
  const YummyDealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Random random = Random();

    return Scaffold(
      backgroundColor: MyColors.Black,
      appBar: AppBar(
          elevation: 0,
          toolbarHeight: 64,
          backgroundColor: Colors.transparent,
          title: Text('Places 🗺️', style: MyTextStyles.Giant_w800.copyWith(color: MyColors.White)),
          actions: [
            Center(
              child: Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: MyColors.Dim600,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(children: [
                  Image.asset(
                    'assets/icons/gem.png',
                    width: 16,
                    height: 16,
                  ),
                  SizedBox(width: 4),
                  Center(
                      child: Text(
                    '480',
                    style: MyTextStyles.Medium_w800.copyWith(color: MyColors.White),
                  )),
                ]),
              ),
            ),
            SizedBox(width: 8),
          ]),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.restaurants.length,
        itemBuilder: (BuildContext ctx, int index) {
          final restaurant = controller.restaurants[index];

          final minutes = 3 + random.nextInt(20);
          return Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: GestureDetector(
                onTap: () {
                  controller.onRestaurantTap(index, minutes);
                },
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: MyColors.White,
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                  ),
                  child: Row(
                    children: [
                      Hero(
                        tag: restaurant.id + 'restaurant',
                        child: Container(
                          height: 160,
                          width: 120,
                          margin: EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                restaurant.thumbnailUrl,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 124,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: Text(restaurant.name, style: MyTextStyles.Medium_w600)),
                              Expanded(
                                child: Text(
                                  restaurant.editorComment,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: MyTextStyles.Small_w400.copyWith(color: MyColors.Dim600),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Text(
                                    restaurant.menus.map((menu) => menu.name).join(', '),
                                    overflow: TextOverflow.ellipsis,
                                    style: MyTextStyles.Tiny_w600.copyWith(color: MyColors.Dim400),
                                  )),
                              GapRow(
                                gap: 4,
                                children: [
                                  Container(
                                    child: GapRow(
                                        padding: const EdgeInsets.only(left: 5, right: 8),
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        gap: 4,
                                        children: [
                                          IconPixel(
                                            name: IconName.STAR,
                                            size: 16,
                                            color: ColorPixel.white,
                                          ),
                                          Text(
                                            restaurant.rating.toString(),
                                            style: MyTextStyles.Tiny_w800.copyWith(
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
                                        padding: const EdgeInsets.only(left: 5, right: 8),
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        gap: 4,
                                        children: [
                                          IconPixel(
                                            name: IconName.DESTINATION,
                                            size: 16,
                                            color: ColorPixel.dim.shade600,
                                          ),
                                          Text(
                                            (minutes).toString() + " min",
                                            style: MyTextStyles.Tiny_w800.copyWith(
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
