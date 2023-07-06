import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'easy_extension_platform_interface.dart';

/// An implementation of [EasyExtensionPlatform] that uses method channels.
class MethodChannelEasyExtension extends EasyExtensionPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('easy_extension');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
