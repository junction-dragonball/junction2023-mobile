import 'package:get/route_manager.dart';
import 'package:yummy_quest/app/presentation/screens/main_screen/main_screen.dart';
import 'package:yummy_quest/app/presentation/screens/main_screen/main_screen_binding.dart';
import 'package:yummy_quest/routes/named_routes.dart';

abstract class GetPages {
  static get pages => [
    GetPage(
      name: RouteNames.MAIN,
      page: () => const MainScreen(),
      binding: MainScreenBinding(),
    )
  ];
}
