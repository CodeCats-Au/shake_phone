import 'package:flutter_test/flutter_test.dart';
import 'package:shake_phone/shake_phone.dart';
import 'package:shake_phone/shake_phone_platform_interface.dart';
import 'package:shake_phone/shake_phone_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockShakePhonePlatform
    with MockPlatformInterfaceMixin
    implements ShakePhonePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ShakePhonePlatform initialPlatform = ShakePhonePlatform.instance;

  test('$MethodChannelShakePhone is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelShakePhone>());
  });

  test('getPlatformVersion', () async {
    ShakePhone shakePhonePlugin = ShakePhone();
    MockShakePhonePlatform fakePlatform = MockShakePhonePlatform();
    ShakePhonePlatform.instance = fakePlatform;

    expect(await shakePhonePlugin.getPlatformVersion(), '42');
  });
}
