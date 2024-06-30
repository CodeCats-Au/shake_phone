
import 'shake_phone_platform_interface.dart';

class ShakePhone {
  Future<String?> getPlatformVersion() {
    return ShakePhonePlatform.instance.getPlatformVersion();
  }
}
