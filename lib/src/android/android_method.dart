import '../interfaces/easy_extension_platform_interface.dart';

class AndroidMethod {
  static Future<String?> getPlatformVersion() {
    return EasyExtensionPlatform.instance.getPlatformVersion();
  }
}
