import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import 'package:notification_permissions/notification_permissions.dart';
import 'main_screen_controller.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              try {
                const platform = MethodChannel('screenTime');
                final bool result = await platform.invokeMethod('getScreenTimeAccess');
                print(result);
              } on PlatformException catch (e) {
                print("Failed to get battery level: '${e.message}'.");
              }
            },
            child: Text('Native Channel 호출'),
          ),
        ],
      ),
    );
  }
}
