import 'package:get/get.dart';
import 'package:yummy_quest/app/domain/models/quest.dart';
import 'package:yummy_quest/app/domain/models/quest_summary.dart';
import 'package:yummy_quest/app/domain/use_cases/fetch_quest_use_case.dart';

class QuestDetailScreenController extends GetxController{
  final FetchQuestUseCase _fetchQuestUseCase;

  QuestDetailScreenController({
    required FetchQuestUseCase fetchQuestUseCase,
  }) : _fetchQuestUseCase = fetchQuestUseCase;

  final QuestSummary questSummary = Get.arguments as QuestSummary;
  late final Quest quest;

  bool isLoading = true;

  @override
  void onInit() async {
    super.onInit();
    await _fetchQuestUseCase(
      id: questSummary.id,
      onSuccess: (quest){
        this.quest = quest;
      },
      onFail: (){
        print('실패');
      }
    );
    isLoading = false;
    update();
  }


}