import 'package:get/get.dart';

class MainIndexedStackScreenController extends GetxController{

  final RxInt currentIndex = 0.obs;

  void onBottomNavItemTap(int index){
    currentIndex(index);
  }
}