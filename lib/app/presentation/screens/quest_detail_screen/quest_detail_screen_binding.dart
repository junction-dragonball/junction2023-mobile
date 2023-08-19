import 'package:get/instance_manager.dart';
import 'package:yummy_quest/app/domain/use_cases/fetch_quest_use_case.dart';
import 'quest_detail_screen_controller.dart';

class QuestDetailScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(QuestDetailScreenController(
      fetchQuestUseCase: FetchQuestUseCase(),
    ));
  }
}