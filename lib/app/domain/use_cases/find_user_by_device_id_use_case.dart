import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:yummy_quest/app/domain/models/user.dart';

class FindUserByDeviceIdUseCase {
  Future<void> call({
    required void Function(User user) onSuccess,
    required void Function() onFail,
  }) async {
    try {
      final deviceInfoPlugin = DeviceInfoPlugin();
      final deviceInfo = await deviceInfoPlugin.deviceInfo;
      final allInfo = deviceInfo.data;
      final deviceId = allInfo['identifierForVendor'];
      final dio = Dio();
      final res = await dio.get('https://dragonball-junction.azurewebsites.net/user/${deviceId}');
      final data = Map<String, dynamic>.from(res.data);
      final user = User.fromMap(data);
      onSuccess(user);
      return;
    } catch (e) {
      onFail();
      rethrow;
    }
  }
}
