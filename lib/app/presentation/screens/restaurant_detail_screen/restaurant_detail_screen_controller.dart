import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yummy_quest/app/domain/models/restaurant.dart';
import 'package:yummy_quest/app/domain/use_cases/fetch_restaurants_use_case.dart';
import 'package:yummy_quest/app/presentation/widgets/gap_layout.dart';

class RestaurantDetailScreenController extends GetxController {
  final FetchRestaurantsUseCase _fetchRestaurantsUseCase;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  RestaurantDetailScreenController({
    required FetchRestaurantsUseCase fetchRestaurantsUseCase,
  }) : _fetchRestaurantsUseCase = fetchRestaurantsUseCase;

  void onAcceptRestaurantButtonTap(BuildContext context) {
    Get.bottomSheet(
      Material(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: GapColumn(
            gap: 12,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 24.0,
                ),
                child: GestureDetector(
                  onTap: Get.back,
                  child: Container(
                    color: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      '확인',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final String restaurantId = Get.arguments[0] as String;
  final int minutes = Get.arguments[1] as int;
  final Restaurant initialRestaurant = Get.arguments[2] as Restaurant;
  late final Restaurant restaurant;

  @override
  void onInit() async {
    super.onInit();
    print(restaurantId);
    print('hasdadsl');
    this.restaurant = initialRestaurant;
    await _fetchRestaurantsUseCase(onSuccess: (restaurants) {
      print('hello');
      this.restaurant =
          restaurants.firstWhereOrNull((row) => row.id == restaurantId) ??
              restaurants.first;
    }, onFail: () {
      print('실패');
    });
    update();
  }
}
