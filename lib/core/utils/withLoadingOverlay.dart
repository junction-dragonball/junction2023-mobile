import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> withLoadingDialog<T>({required Future<T> Function() asyncFunction}) async {
  Get.showOverlay(
    asyncFunction: asyncFunction,
    loadingWidget: Center(
      child: CircularProgressIndicator(
        color: Colors.blue,
      )
    ),
    opacityColor: Colors.black26,
    opacity: 1,
  );
}
