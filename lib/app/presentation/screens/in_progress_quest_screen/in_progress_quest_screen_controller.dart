import 'package:get/get.dart';
import 'package:yummy_quest/app/domain/models/quest_summary.dart';
import 'package:yummy_quest/app/presentation/screens/main_indexed_stack_screen/main_indexed_stack_screen_controller.dart';
import 'package:yummy_quest/routes/named_routes.dart';

class InProgressQuestScreenController extends GetxController{
  final List<QuestSummary> questSummaries = List<QuestSummary>.from(Get.arguments);

  void onQuestTap(int index)async {
    await Get.toNamed(
      RouteNames.Maker(nextRoute: RouteNames.QUEST_DETAIL),
      arguments: {
        'questSummary': questSummaries[index],
        'heroSuffix': 'second',
      },
    );
    Get.find<MainIndexedStackScreenController>().updateUser();
    Get.back();
  }
}