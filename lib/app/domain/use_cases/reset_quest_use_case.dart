import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ResetQuestUseCase {
  Future<void> call({
    required void Function() onSuccess,
    required void Function() onFail,
  }) async {
    try {
      final dio = Get.find<Dio>();
      await dio.post('https://dragonball-junction.azurewebsites.net/quest/progress/reset');
      onSuccess();
      return;
    } catch (e) {
      onFail();
      rethrow;
    }
  }
}
