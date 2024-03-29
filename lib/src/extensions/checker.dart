part of '../../easy_extension.dart';

class Checker {
  static Future<bool?> isVpnActive() async {
    try {
      bool isVpnActive;

      List<NetworkInterface> interfaces = await NetworkInterface.list(
        includeLoopback: false,
        type: InternetAddressType.any,
      );

      interfaces.isNotEmpty
          ? isVpnActive = interfaces.any((interface) =>
              interface.name.contains("tun") || interface.name.contains("ppp") || interface.name.contains("pptp"))
          : isVpnActive = false;

      return isVpnActive;
    } catch (_) {
      return null;
    }
  }
}
