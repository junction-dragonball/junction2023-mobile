import 'package:get/instance_manager.dart';
import 'main_indexed_stack_screen_controller.dart';

class MainIndexedStackScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainIndexedStackScreenController());
  }
}