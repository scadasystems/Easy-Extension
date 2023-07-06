part of easy_extension;

extension PixelToDevice on num {
  double get px => this / Get.pixelRatio;
  double get pxReal => this * Get.pixelRatio;
}
