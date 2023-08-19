import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:yummy_quest/app/domain/use_cases/find_user_by_device_id_use_case.dart';
import 'package:yummy_quest/routes/named_routes.dart';

class SplashScreenController extends GetxController {
  final FindUserByDeviceIdUseCase _findUserByDeviceIdUseCase;

  SplashScreenController({
    required FindUserByDeviceIdUseCase findUserByDeviceIdUseCase,
  }) : _findUserByDeviceIdUseCase = findUserByDeviceIdUseCase;

  @override
  void onReady() async {
    super.onReady();
    await _findUserByDeviceIdUseCase(
      onSuccess: (user) {
        final Dio dio = Dio();
        dio.options = BaseOptions(
          headers: {
            'Authorization': '${user.id}',
          },
        );
        Get.put<Dio>(dio);
        Get.offAllNamed(RouteNames.MAIN);
      },
      onFail: () {
        print('실패하면 앱 종료시키기');
      },
    );
  }
}
