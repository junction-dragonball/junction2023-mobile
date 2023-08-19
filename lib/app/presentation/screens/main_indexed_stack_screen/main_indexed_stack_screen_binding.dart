import 'package:get/instance_manager.dart';
import 'package:yummy_quest/app/domain/use_cases/find_user_by_device_id_use_case.dart';
import 'main_indexed_stack_screen_controller.dart';

class MainIndexedStackScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainIndexedStackScreenController(
      findUserByDeviceIdUseCase: FindUserByDeviceIdUseCase(),
    ));
  }
}