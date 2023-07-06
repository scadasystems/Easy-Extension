import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'easy_extension_method_channel.dart';

abstract class EasyExtensionPlatform extends PlatformInterface {
  EasyExtensionPlatform() : super(token: _token);

  static final Object _token = Object();

  static EasyExtensionPlatform _instance = MethodChannelEasyExtension();

  static EasyExtensionPlatform get instance => _instance;

  static set instance(EasyExtensionPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);

    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
