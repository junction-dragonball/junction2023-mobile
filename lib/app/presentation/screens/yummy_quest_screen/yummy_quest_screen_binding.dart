import 'package:get/instance_manager.dart';
import 'yummy_quest_screen_controller.dart';

class YummyQuestScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(YummyQuestScreenController());
  }
}