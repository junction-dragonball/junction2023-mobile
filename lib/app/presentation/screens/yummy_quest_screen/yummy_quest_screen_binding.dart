import 'package:get/instance_manager.dart';
import 'package:yummy_quest/app/domain/use_cases/fetch_quests_use_case.dart';
import 'package:yummy_quest/app/domain/use_cases/reset_quest_use_case.dart';

import 'yummy_quest_screen_controller.dart';

class YummyQuestScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(YummyQuestScreenController(
      fetchQuestsUseCase: FetchQuestsUseCase(),
      resetQuestUseCase: ResetQuestUseCase(),
    ));
  }
}
