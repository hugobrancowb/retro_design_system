import 'dart:math';
import 'dart:ui';

class RetroColors {
  static final List<Color> allColors = [
    const Color(0xFF4527a0),
    const Color(0xFFF46197),
    const Color(0xFF0496FF),
    const Color(0xFFEC368D),
  ];

  static Color get randomColor {
    var index = Random().nextInt(allColors.length);
    return allColors[index];
  }
}
