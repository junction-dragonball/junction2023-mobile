import 'package:get/instance_manager.dart';
import 'my_page_screen_controller.dart';

class MyPageScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MyPageScreenController());
  }
}