import 'package:get/get.dart';
import 'package:yummy_quest/app/domain/models/restaurant.dart';
import 'package:yummy_quest/app/domain/use_cases/fetch_restaurants_use_case.dart';
import 'package:yummy_quest/routes/named_routes.dart';

class YummyDealScreenController extends GetxController {
  final FetchRestaurantsUseCase _fetchRestaurantsUseCase;

  YummyDealScreenController({
    required FetchRestaurantsUseCase fetchRestaurantsUseCase,
  }) : _fetchRestaurantsUseCase = fetchRestaurantsUseCase;

  bool isLoading = true;

  late List<Restaurant> restaurants;

  @override
  void onInit() async {
    super.onInit();
    await _fetchRestaurantsUseCase(
      onSuccess: (restaurants) {
        this.restaurants = restaurants;
      },
      onFail: () {
        print('실패했음 ㅜㅜ');
      },
    );
    isLoading = false;
    update();
  }

  void onRestaurantTap(int index) {
    Get.toNamed(
      RouteNames.Maker(nextRoute: RouteNames.RESTAURANT_DETAIL),
      arguments: restaurants[index],
    );
  }
}
