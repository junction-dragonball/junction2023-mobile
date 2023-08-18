import 'package:get/instance_manager.dart';
import 'main_screen_controller.dart';

class MainScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainScreenController());
  }
}