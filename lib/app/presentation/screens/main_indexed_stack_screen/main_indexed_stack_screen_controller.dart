import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:yummy_quest/app/domain/models/user.dart';
import 'package:yummy_quest/app/domain/use_cases/find_user_by_device_id_use_case.dart';

class MainIndexedStackScreenController extends GetxController {
  final FindUserByDeviceIdUseCase _findUserByDeviceIdUseCase;

  MainIndexedStackScreenController({
    required FindUserByDeviceIdUseCase findUserByDeviceIdUseCase,
  }) : _findUserByDeviceIdUseCase = findUserByDeviceIdUseCase;

  final RxInt currentIndex = 0.obs;

  @override
  void onReady() {
    super.onReady();

    FlutterNativeSplash.remove();
  }

  void onBottomNavItemTap(int index) {
    if (index == 2) {
      return;
    }
    currentIndex(index);
  }

  final Rx<User> user = (Get.arguments as User).obs;

  void updateUser() async {
    await _findUserByDeviceIdUseCase(
      onSuccess: (user){
        this.user(user);
      },
      onFail: (){
        print('update user fail');
      },
    );
  }


}
