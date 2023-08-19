import 'package:get/instance_manager.dart';
import 'package:yummy_quest/app/domain/use_cases/fetch_restaurants_use_case.dart';
import 'yummy_deal_screen_controller.dart';

class YummyDealScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(YummyDealScreenController(
      fetchRestaurantsUseCase: FetchRestaurantsUseCase(),
    ));
  }
}
