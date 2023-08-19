import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:yummy_quest/app/domain/models/quest.dart';

class GetRewardUseCase {
  Future<void> call({
    required String questId,
    required void Function(Quest quest) onSuccess,
    required void Function() onFail,
  }) async {
    try {
      final dio = Get.find<Dio>();
      await dio.post('https://dragonball-junction.azurewebsites.net/quest/$questId/get-point');
      final res = await dio.get('https://dragonball-junction.azurewebsites.net/quest/${questId}');
      final data = Map<String, dynamic>.from(res.data);
      final Quest quest = Quest.fromMap(data);
      onSuccess(quest);
      return;
    } catch (e) {
      onFail();
      rethrow;
    }
  }
}
