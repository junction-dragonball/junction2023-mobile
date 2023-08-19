import 'package:get/get.dart';

abstract class RouteNames {
  static const String SPLASH = '/';
  static const String MAIN = '/main';
  static const String QUEST_DETAIL = '/quest_detail';
  static const String RESTAURANT_DETAIL = '/restaurant_detail';

  static String Maker({
    required String nextRoute,
    Map<String, String>? parameters,
  }) {
    String currentRoute = Get.currentRoute;

    String resultRoute = '';
    int subIndex = currentRoute.indexOf('?');
    if (subIndex != -1) {
      resultRoute =
          '${currentRoute.substring(0, subIndex)}$nextRoute${currentRoute.substring(subIndex, currentRoute.length)}&';
    } else {
      resultRoute = '$currentRoute$nextRoute?';
    }
    if (parameters == null) {
      return resultRoute.substring(0, resultRoute.length - 1);
    } else {
      for (String key in parameters.keys) {
        resultRoute += '$key=${parameters[key]}&';
      }
      return resultRoute.substring(0, resultRoute.length - 1);
    }
  }
}
