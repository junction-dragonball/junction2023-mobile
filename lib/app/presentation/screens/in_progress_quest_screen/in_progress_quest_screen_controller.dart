import 'package:get/get.dart';
import 'package:yummy_quest/app/domain/models/quest_summary.dart';
import 'package:yummy_quest/routes/named_routes.dart';

class InProgressQuestScreenController extends GetxController{
  final List<QuestSummary> questSummaries = List<QuestSummary>.from(Get.arguments);

  void onQuestTap(int index) {
    Get.toNamed(
      RouteNames.Maker(nextRoute: RouteNames.QUEST_DETAIL),
      arguments: {
        'questSummary': questSummaries[index],
        'heroSuffix': 'second',
      },
    );
  }
}