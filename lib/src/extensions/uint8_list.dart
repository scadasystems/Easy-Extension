part of '../../easy_extension.dart';

extension Uint8ListExension on Uint8List {
  String get toBase64String => base64Encode(this);
}
