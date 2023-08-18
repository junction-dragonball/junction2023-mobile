import 'package:get/instance_manager.dart';
import 'yummy_deal_screen_controller.dart';

class YummyDealScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(YummyDealScreenController());
  }
}