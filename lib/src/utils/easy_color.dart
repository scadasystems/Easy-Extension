part of easy_extension;

class EasyColor {
  late Color _color;

  EasyColor(Color color) {
    _color = Color.fromARGB(color.alpha, color.red, color.green, color.blue);
  }

  factory EasyColor.fromRGB({required int r, required int g, required int b, int a = 100}) {
    return EasyColor(Color.fromARGB(a, r, g, b));
  }

  factory EasyColor.fromHSL(HslColor hsl) {
    return EasyColor(hslToColor(hsl));
  }

  factory EasyColor.fromHSV(HSVColor hsv) {
    return EasyColor(hsv.toColor());
  }

  factory EasyColor.fromString(String string) {
    return EasyColor(Pigment.fromString(string));
  }

  bool isDark() {
    return getBrightness() < 128.0;
  }

  bool isLight() {
    return !isDark();
  }

  double getBrightness() {
    return (_color.red * 299 + _color.green * 587 + _color.blue * 114) / 1000;
  }

  double getLuminance() {
    return _color.computeLuminance();
  }

  EasyColor setAlpha(int alpha) {
    _color.withAlpha(alpha);
    return this;
  }

  EasyColor setOpacity(double opacity) {
    _color.withOpacity(opacity);
    return this;
  }

  HSVColor toHsv() {
    return colorToHsv(_color);
  }

  HslColor toHsl() {
    final hsl = rgbToHsl(
      r: _color.red.toDouble(),
      g: _color.green.toDouble(),
      b: _color.blue.toDouble(),
    );
    return HslColor(
      h: hsl.h * 360,
      s: hsl.s,
      l: hsl.l,
      a: _color.alpha.toDouble(),
    );
  }

  EasyColor clone() {
    return EasyColor(_color);
  }

  EasyColor lighten([int amount = 10]) {
    final hsl = toHsl();
    hsl.l += amount / 100;
    hsl.l = clamp01(hsl.l);
    return EasyColor.fromHSL(hsl);
  }

  EasyColor brighten([int amount = 10]) {
    final color = Color.fromARGB(
      _color.alpha,
      math.max(0, math.min(255, _color.red - (255 * -(amount / 100)).round())),
      math.max(0, math.min(255, _color.green - (255 * -(amount / 100)).round())),
      math.max(0, math.min(255, _color.blue - (255 * -(amount / 100)).round())),
    );
    return EasyColor(color);
  }

  EasyColor darken([int amount = 10]) {
    final hsl = toHsl();
    hsl.l -= amount / 100;
    hsl.l = clamp01(hsl.l);
    return EasyColor.fromHSL(hsl);
  }

  EasyColor tint([int amount = 10]) {
    return mix(input: const Color.fromRGBO(255, 255, 255, 1.0));
  }

  EasyColor shade([int amount = 10]) {
    return mix(input: const Color.fromRGBO(0, 0, 0, 1.0));
  }

  EasyColor desaturate([int amount = 10]) {
    final hsl = toHsl();
    hsl.s -= amount / 100;
    hsl.s = clamp01(hsl.s);
    return EasyColor.fromHSL(hsl);
  }

  EasyColor saturate([int amount = 10]) {
    final hsl = toHsl();
    hsl.s += amount / 100;
    hsl.s = clamp01(hsl.s);
    return EasyColor.fromHSL(hsl);
  }

  EasyColor greyscale() {
    return desaturate(100);
  }

  EasyColor spin(double amount) {
    final hsl = toHsl();
    final hue = (hsl.h + amount) % 360;
    hsl.h = hue < 0 ? 360 + hue : hue;
    return EasyColor.fromHSL(hsl);
  }

  EasyColor mix({required Color input, int amount = 50}) {
    final int p = (amount / 100).round();
    final color = Color.fromARGB((input.alpha - _color.alpha) * p + _color.alpha, (input.red - _color.red) * p + _color.red, (input.green - _color.green) * p + _color.green, (input.blue - _color.blue) * p + _color.blue);
    return EasyColor(color);
  }

  EasyColor complement() {
    final hsl = toHsl();
    hsl.h = (hsl.h + 180) % 360;
    return EasyColor.fromHSL(hsl);
  }

  Color get color {
    return _color;
  }
}
