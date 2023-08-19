import 'package:get/get.dart';
import 'package:yummy_quest/app/domain/models/user.dart';

class MainIndexedStackScreenController extends GetxController{

  final RxInt currentIndex = 0.obs;

  void onBottomNavItemTap(int index){
    currentIndex(index);
  }

  User user = Get.arguments as User;


}