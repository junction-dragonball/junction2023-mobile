import 'package:get/instance_manager.dart';
import 'in_progress_quest_screen_controller.dart';

class InProgressQuestScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(InProgressQuestScreenController());
  }
}