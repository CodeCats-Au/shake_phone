import 'shake_phone_platform_interface.dart';

class ShakePhone {
  Future<String?> getPlatformVersion() {
    return ShakePhonePlatform.instance.getPlatformVersion();
  }

  Future<void> setShakeCallback(ShakeCallback callback) {
    return ShakePhonePlatform.instance.setShakeCallback(callback);
  }
}
