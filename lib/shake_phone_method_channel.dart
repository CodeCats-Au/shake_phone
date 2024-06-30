import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'shake_phone_platform_interface.dart';

/// An implementation of [ShakePhonePlatform] that uses method channels.
class MethodChannelShakePhone extends ShakePhonePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('shake_phone');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
