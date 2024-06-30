import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'shake_phone_method_channel.dart';

typedef ShakeCallback = void Function();

abstract class ShakePhonePlatform extends PlatformInterface {
  ShakePhonePlatform() : super(token: _token);

  static final Object _token = Object();

  static ShakePhonePlatform _instance = MethodChannelShakePhone();

  static ShakePhonePlatform get instance => _instance;

  static set instance(ShakePhonePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> setShakeCallback(ShakeCallback callback) {
    throw UnimplementedError('setShakeCallback() has not been implemented.');
  }
}
