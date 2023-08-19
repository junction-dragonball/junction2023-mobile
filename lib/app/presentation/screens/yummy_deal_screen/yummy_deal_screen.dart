import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:yummy_quest/app/presentation/widgets/gap_layout.dart';
import 'yummy_deal_screen_controller.dart';

class YummyDealScreen extends GetView<YummyDealScreenController> {
  const YummyDealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('yummy_deal')),
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
                  Container(
                    height: 120,
                    width: 120,
                    color: Colors.grey,
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
