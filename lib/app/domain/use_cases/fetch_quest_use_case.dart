import 'package:dio/dio.dart';
import 'package:yummy_quest/app/domain/models/quest.dart';

class FetchQuestUseCase {
  Future<void> call({
    required String id,
    required void Function(Quest quest) onSuccess,
    required void Function() onFail,
  }) async {
    try {
      final dio = Dio();
      final res = await dio.get('https://dragonball-junction.azurewebsites.net/quest/$id');
      final data = Map<String, dynamic>.from(res.data);
      final Quest quest = Quest.fromMap(data);
      onSuccess(quest);
      return;
    } catch(e) {
      onFail();
      rethrow;
    }
  }
}
