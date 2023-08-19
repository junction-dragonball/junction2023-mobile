import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:yummy_quest/app/presentation/widgets/gap_layout.dart';
import 'package:yummy_quest/core/themes/color_theme.dart';
import 'package:yummy_quest/core/themes/text_theme.dart';
import 'yummy_deal_screen_controller.dart';

class YummyDealScreen extends GetView<YummyDealScreenController> {
  const YummyDealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Black,
      appBar: AppBar(
          toolbarHeight: 64,
          backgroundColor: Colors.transparent,
          title: Text('Places 🗺️',
              style: MyTextStyles.Giant_w800.copyWith(color: MyColors.White)),
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
                  Icon(Icons.circle),
                  SizedBox(width: 4),
                  Center(
                      child: Text(
                    '480',
                    style: MyTextStyles.Medium_w800.copyWith(
                        color: MyColors.White),
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
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                controller.onRestaurantTap(index);
              },
              child: Row(
                children: [
                  Hero(
                    tag: restaurant.id,
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            restaurant.thumbnailUrl,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 120,
                      color: Colors.black12,
                      child: GapColumn(
                        gap: 2,
                        padding: const EdgeInsets.all(12),
                        children: [
                          Row(children: [
                            Text(restaurant.name),
                            Text(restaurant.rating.toString()),
                          ]),
                          Expanded(
                            child: Text(
                              restaurant.menus
                                  .map((menu) => menu.name)
                                  .join(', '),
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                color: Colors.blue,
                                child: Text(restaurant.name),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
