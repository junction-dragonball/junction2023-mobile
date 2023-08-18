import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:yummy_quest/app/domain/use_cases/request_screen_time_access_use_case.dart';
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
              final a = await RequestScreenTimeAccessUseCase()();
              print(a);
            },
            child: Text('Native Channel 호출'),
          ),
        ],
      ),
    );
  }
}
