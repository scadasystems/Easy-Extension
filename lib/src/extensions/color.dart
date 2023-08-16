part of easy_extension;

extension ColorExtension on Color {
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';

  Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Change Font color from background color
  /// Only White & Black
  Color get textComplementaryColor {
    return computeLuminance() > 0.179 ? Colors.black : Colors.white;
  }

  /// Converts standard Color to EasyColor object
  EasyColor toEasyColor() => EasyColor(this);

  HSVColor toHsv() => EasyColor(this).toHsv();

  HslColor toHsl() => EasyColor(this).toHsl();

  /// Lighten the color a given amount, from 0 to 100. Providing 100 will always return white.
  Color lighten([int amount = 10]) => EasyColor(this).lighten(amount).color;

  /// Brighten the color a given amount, from 0 to 100.
  Color brighten([int amount = 10]) => EasyColor(this).brighten(amount).color;

  /// Darken the color a given amount, from 0 to 100. Providing 100 will always return black.
  Color darken([int amount = 10]) => EasyColor(this).darken(amount).color;

  /// Mix the color with pure white, from 0 to 100. Providing 0 will do nothing, providing 100 will always return white.
  Color tint([int amount = 10]) => EasyColor(this).tint(amount).color;

  /// Mix the color with pure black, from 0 to 100. Providing 0 will do nothing, providing 100 will always return black.
  Color shade([int amount = 10]) => EasyColor(this).shade(amount).color;

  /// Desaturate the color a given amount, from 0 to 100. Providing 100 will is the same as calling greyscale.
  Color desaturate([int amount = 10]) =>
      EasyColor(this).desaturate(amount).color;

  /// Saturate the color a given amount, from 0 to 100.
  Color saturate([int amount = 10]) => EasyColor(this).saturate(amount).color;

  /// Completely desaturates a color into greyscale. Same as calling desaturate(100).
  Color get greyscale => EasyColor(this).greyscale().color;

  /// Spin the hue a given amount, from -360 to 360. Calling with 0, 360, or -360 will do nothing (since it sets the hue back to what it was before).
  Color spin([double amount = 0]) => EasyColor(this).spin(amount).color;

  /// Returns the perceived brightness of a color, from 0-255, as defined by Web Content Accessibility Guidelines (Version 1.0).Returns the perceived brightness of a color, from 0-255, as defined by Web Content Accessibility Guidelines (Version 1.0).
  double get brightness => EasyColor(this).getBrightness();

  /// Return the perceived luminance of a color, a shorthand for flutter Color.computeLuminance
  double get luminance => EasyColor(this).getLuminance();

  /// Return a boolean indicating whether the color's perceived brightness is light.
  bool get isLight => EasyColor(this).isLight();

  /// Return a boolean indicating whether the color's perceived brightness is dark.
  bool get isDark => EasyColor(this).isDark();

  /// Returns the Complimentary Color for dynamic matching
  Color get compliment => EasyColor(this).complement().color;

  /// Blends the color with another color a given amount, from 0 - 100, default 50.
  Color mix(Color toColor, [int amount = 50]) =>
      EasyColor(this).mix(input: toColor, amount: amount).color;

  /// Font color  contrasted against color. <br>
  /// Only [Colors.black] & [Color.white]
  Color get getFontColorRelativeBackgroundColor =>
      computeLuminance() > 0.179 ? Colors.black : Colors.white;
}
