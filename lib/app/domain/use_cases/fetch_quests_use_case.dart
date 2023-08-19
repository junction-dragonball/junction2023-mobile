import 'package:dio/dio.dart';
import 'package:yummy_quest/app/domain/models/quest_summary.dart';

class FetchQuestsUseCase {
  Future<void> call({
    required void Function(List<QuestSummary> questSummaries) onSuccess,
    required void Function() onFail,
  }) async {
    final dio = Dio();
    try {
      final res = await dio.get('https://dragonball-junction.azurewebsites.net/quest');
      print(res.data);
      final data = List<Map<String, dynamic>>.from(res.data);
      print(data);
      final List<QuestSummary> questSummaries = data.map((e) => QuestSummary.fromMap(e)).toList();
      print(questSummaries);
      onSuccess(questSummaries);
      return;
    } catch (e) {
      onFail();
      rethrow;
      return;
    }
  }
}
