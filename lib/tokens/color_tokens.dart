part of retro_design_system;

class RetroColors {
  static const purple = Color(0xFF4527a0);
  static const pink = Color(0xFFF46197);
  static const magenta = Color(0xFFEC368D);
  static const blue = Color(0xFF0496FF);

  static final List<Color> allColors = [purple, pink, magenta, blue];

  static Color get randomColor {
    var index = Random().nextInt(allColors.length);
    return allColors[index];
  }
}
