import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:yummy_quest/app/presentation/screens/restaurant_detail_screen/restaurant_detail_screen_controller.dart';
import 'package:yummy_quest/app/presentation/widgets/gap_layout.dart';

class RestaurantDetailScreen extends GetView<RestaurantDetailScreenController> {
  const RestaurantDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        key: controller.scaffoldKey,
        body: Stack(
          children: [
            Positioned.fill(
              child: SafeArea(
                bottom: false,
                child: SingleChildScrollView(
                  child: GetBuilder<RestaurantDetailScreenController>(
                      builder: (controller) {
                    final isLoading = controller.isLoading;
                    if (controller.isLoading)
                      return CircularProgressIndicator();
                    return Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: SizedBox(
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Center(
                                  child: isLoading
                                      ? Text('loading')
                                      : Hero(
                                          tag: controller.restaurant.id,
                                          child: Image.network(controller
                                              .restaurant.thumbnailUrl),
                                        ),
                                ),
                                Positioned(
                                  left: 8,
                                  top: 8,
                                  child: IconButton(
                                    onPressed: Get.back,
                                    icon: Icon(Icons.arrow_back_ios),
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  bottom: 20,
                                  child: Container(
                                    color: Colors.grey,
                                    padding: const EdgeInsets.all(4),
                                    child: Text(
                                        // TODO: Restaurant 객체로 바꿔야함
                                        'NEW!'
                                        // restaurant.status.text,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 24),
                        GapColumn(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16,
                          ),
                          gap: 12,
                          children: [
                            Text(
                              isLoading
                                  ? 'loading'
                                  : controller.restaurant.name,
                              style: TextStyle(fontSize: 36),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    color: Colors.grey,
                                    padding: const EdgeInsets.all(8),
                                    child: GapColumn(
                                      gap: 8,
                                      children: [
                                        GapRow(
                                          gap: 4,
                                          children: [
                                            CircleAvatar(
                                              radius: 10,
                                              backgroundColor: Colors.pink,
                                            ),
                                            Text(isLoading
                                                ? '000'
                                                : controller.restaurant.rating
                                                    .toString()),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Container(
                                    color: Colors.grey,
                                    padding: const EdgeInsets.all(8),
                                  ),
                                ),
                              ],
                            ),
                            Text('메뉴'),
                            ...controller.restaurant.menus
                                .map((menu) => Row(children: [
                                      Container(
                                        height: 120,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              controller
                                                  .restaurant.thumbnailUrl,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(children: [
                                        Text(menu.name),
                                        Text(menu.price.toString()),
                                      ]),
                                    ]))
                          ],
                        ),
                        const SizedBox(height: 48),
                      ],
                    );
                  }),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                color: Colors.transparent,
                padding: const EdgeInsets.all(24.0),
                child: GestureDetector(
                  onTap: () {
                    controller.onAcceptRestaurantButtonTap(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 24,
                    ),
                    color: Colors.black,
                    child: Text(
                      '퀘스트 수락',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
