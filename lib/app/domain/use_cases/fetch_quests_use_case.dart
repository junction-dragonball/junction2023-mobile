import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:yummy_quest/app/domain/models/quest_summary.dart';

class FetchQuestsUseCase {
  Future<void> call({
    required void Function(List<QuestSummary> questSummaries) onSuccess,
    required void Function() onFail,
  }) async {
    try {
      final dio = Get.find<Dio>();
      final res =
          await dio.get('https://dragonball-junction.azurewebsites.net/quest');
      final data = List<Map<String, dynamic>>.from(res.data);
      final List<QuestSummary> questSummaries =
          data.map((e) => QuestSummary.fromMap(e)).toList();
      onSuccess(questSummaries);
      return;
    } catch (e) {
      onFail();
      rethrow;
    }
  }
}
