import 'package:get/instance_manager.dart';
import 'package:yummy_quest/app/domain/use_cases/fetch_restaurants_use_case.dart';
import 'package:yummy_quest/app/presentation/screens/restaurant_detail_screen/restaurant_detail_screen_controller.dart';

class RestaurantDetailScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RestaurantDetailScreenController(
      fetchRestaurantsUseCase: FetchRestaurantsUseCase(),
    ));
  }
}
