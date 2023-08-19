import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:yummy_quest/app/domain/models/restaurant.dart';

class FetchRestaurantsUseCase {
  Future<void> call({
    required void Function(List<Restaurant> restaurants) onSuccess,
    required void Function() onFail,
  }) async {
    final dio = Get.find<Dio>();
    try {
      final res = await dio
          .get('https://dragonball-junction.azurewebsites.net/restaurant');
      final data = List<Map<String, dynamic>>.from(res.data);
      final List<Restaurant> restaurants =
          data.map((e) => Restaurant.fromMap(e)).toList();
      onSuccess(restaurants);
      return;
    } catch (e) {
      print(e);
      onFail();
      rethrow;
    }
  }
}
