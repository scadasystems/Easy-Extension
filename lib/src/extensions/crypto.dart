import 'package:encrypt/encrypt.dart' as crypto;

class EasyCrypto {
  static String? initSecretKey;

  static void setKey(String key) {
    initSecretKey = key;
  }

  static String encryption(String secretkey, String text) {
    final key = crypto.Key.fromUtf8(initSecretKey ?? secretkey);
    final iv = crypto.IV.fromLength(16);
    final encrypter = crypto.Encrypter(crypto.AES(key));
    final encryptString = encrypter.encrypt(text, iv: iv).base64;

    return encryptString;
  }

  static String decryption(String secretkey, String encrypt) {
    final key = crypto.Key.fromUtf8(initSecretKey ?? secretkey);
    final iv = crypto.IV.fromLength(16);
    final encrypter = crypto.Encrypter(crypto.AES(key));

    String decryptionString = '';

    try {
      decryptionString = encrypter.decrypt64(encrypt, iv: iv);
    } catch (_) {}

    return decryptionString;
  }
}
