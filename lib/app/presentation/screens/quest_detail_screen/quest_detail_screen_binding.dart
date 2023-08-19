import 'package:get/instance_manager.dart';
import 'quest_detail_screen_controller.dart';

class QuestDetailScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(QuestDetailScreenController());
  }
}