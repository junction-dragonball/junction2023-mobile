import 'package:flutter/services.dart';

class RequestScreenTimeAccessUseCase {

  Future<bool> call() async {
    try {
      const platform = MethodChannel('screenTime');
      final bool result = await platform.invokeMethod('getScreenTimeAccess');
      return result;
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }
}