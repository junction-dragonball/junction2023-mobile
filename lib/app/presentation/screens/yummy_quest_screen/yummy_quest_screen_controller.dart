import 'package:get/get.dart';
import 'package:yummy_quest/app/domain/models/quest_summary.dart';
import 'package:yummy_quest/app/domain/use_cases/fetch_quests_use_case.dart';
import 'package:yummy_quest/routes/named_routes.dart';

class YummyQuestScreenController extends GetxController {
  final FetchQuestsUseCase _fetchQuestsUseCase;

  YummyQuestScreenController({
    required FetchQuestsUseCase fetchQuestsUseCase,
  }) : _fetchQuestsUseCase = fetchQuestsUseCase;

  bool isLoading = true;

  late List<QuestSummary> questSummaries;

  @override
  void onInit() async {
    super.onInit();
    await _fetchQuestsUseCase(
      onSuccess: (questSummaries) {
        this.questSummaries = questSummaries;
      },
      onFail: (){
        print('실패했음 ㅜㅜ');
      },
    );
    isLoading = false;
    update();
  }

  void onQuestTap(int index) {
    Get.toNamed(
      RouteNames.Maker(nextRoute: RouteNames.QUEST_DETAIL),
      arguments: questSummaries[index],
    );
  }
}
