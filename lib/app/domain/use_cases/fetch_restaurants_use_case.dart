import 'package:dio/dio.dart';
import 'package:yummy_quest/app/domain/models/restaurant.dart';

class FetchRestaurantsUseCase {
  Future<void> call({
    required void Function(List<Restaurant> restaurants) onSuccess,
    required void Function() onFail,
  }) async {
    final dio = Dio();
    try {
      print('hihi');
      final res = await dio
          .get('https://dragonball-junction.azurewebsites.net/restaurant');
      print(res);
      final data = List<Map<String, dynamic>>.from(res.data);
      print(data);
      final List<Restaurant> restaurants =
          data.map((e) => Restaurant.fromMap(e)).toList();
      onSuccess(restaurants);
      return;
    } catch (e) {
      print('hihihi');
      print(e);
      onFail();
      rethrow;
    }
  }
}
