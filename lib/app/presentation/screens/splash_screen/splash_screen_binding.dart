import 'package:get/instance_manager.dart';
import 'package:yummy_quest/app/domain/use_cases/find_user_by_device_id_use_case.dart';
import 'splash_screen_controller.dart';

class SplashScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      SplashScreenController(
        findUserByDeviceIdUseCase: FindUserByDeviceIdUseCase(),
      ),
    );
  }
}
