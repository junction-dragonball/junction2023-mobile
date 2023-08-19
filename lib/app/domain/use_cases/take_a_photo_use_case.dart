import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TakeAPhotoUseCase {
  Future<void> call({
    required BuildContext ctx,
    required void Function(File file) onSuccess,
    required void Function() onCancel,
    required void Function() onFail,
  }) async {
    final _picker = ImagePicker();
    await showCupertinoModalPopup(
      context: ctx,
      builder: (context) => CupertinoActionSheet(
        title: Text('Choose an option'),
        actions: [
          CupertinoActionSheetAction(
            child: Text('Pick from Gallery'),
            onPressed: () async {
              try {
                final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
                if (photo == null) {
                  onCancel();
                  return;
                }
                onSuccess(File(photo.path));
              } catch (e) {
                rethrow;
              }
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Take a Picture'),
            onPressed: () async {
              try {
                final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
                if (photo == null) {
                  onCancel();
                  return;
                }
                onSuccess(File(photo.path));
              } catch (e) {
                rethrow;
              }
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text('Cancel'),
          onPressed: () {
            Get.back();
          },
        ),
      ),
    );
  }
}
