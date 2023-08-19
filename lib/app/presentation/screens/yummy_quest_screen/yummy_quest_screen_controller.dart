import 'package:get/get.dart';
import 'package:yummy_quest/app/domain/models/quest.dart';
import 'package:yummy_quest/routes/named_routes.dart';

class YummyQuestScreenController extends GetxController {
  final quests = List.generate(
    8,
    (index) => Quest(
      title: 'title $index',
      description: 'description asdfasdfas' * (index + 1),
      status: index % 3 == 1
          ? QuestStatus.done
          : index % 3 == 2
              ? QuestStatus.inProgress
              : QuestStatus.newly,
      difficulty: index % 5 + 1,
      reward: index * 120 + 120,
    ),
  );

  void onQuestTap(int index) {
    Get.toNamed(
      RouteNames.Maker(nextRoute: RouteNames.QUEST_DETAIL),
      arguments: quests[index],
    );
  }
}
