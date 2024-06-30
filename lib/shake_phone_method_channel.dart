import 'package:flutter/services.dart';

import 'shake_phone_platform_interface.dart';

class MethodChannelShakePhone extends ShakePhonePlatform {
  MethodChannelShakePhone() {
    methodChannel.setMethodCallHandler(_handleMethod);
  }

  final methodChannel = const MethodChannel('shake_phone');
  ShakeCallback? onShake;

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');

    return version;
  }

  @override
  Future<void> setShakeCallback(ShakeCallback? callback) async {
    onShake = callback;
  }

  Future<dynamic> _handleMethod(MethodCall call) {
    switch (call.method) {
      case 'onShake':
        onShake?.call();
        return Future.value();
      default:
        return Future.error('method not defined');
    }
  }
}
