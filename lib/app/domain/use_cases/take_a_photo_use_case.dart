import 'dart:io';

import 'package:image_picker/image_picker.dart';

class TakeAPhotoUseCase {
  Future<void> call({
    required void Function(File file) onSuccess,
    required void Function() onCancel,
    required void Function() onFail,
  }) async {
    try {
      final picker = ImagePicker();
      final XFile? photo = await picker.pickImage(source: ImageSource.camera);
      if(photo == null){
        onCancel();
        return;
      }
      onSuccess(File(photo.path));
      return;
    } catch (e) {
      onFail();
      return;
    }
  }
}
