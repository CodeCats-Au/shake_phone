import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'shake_phone_method_channel.dart';

abstract class ShakePhonePlatform extends PlatformInterface {
  /// Constructs a ShakePhonePlatform.
  ShakePhonePlatform() : super(token: _token);

  static final Object _token = Object();

  static ShakePhonePlatform _instance = MethodChannelShakePhone();

  /// The default instance of [ShakePhonePlatform] to use.
  ///
  /// Defaults to [MethodChannelShakePhone].
  static ShakePhonePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ShakePhonePlatform] when
  /// they register themselves.
  static set instance(ShakePhonePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
