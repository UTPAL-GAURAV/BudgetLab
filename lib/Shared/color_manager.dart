
import 'dart:ui';

class ColorManager {
  static Color PRIMARY = HexColor.fromHex("#00000");
}

extension HexColor on Color {
  static Color fromHex(String hex) {
    // remove the hash symbol from the hex string
    hex = hex.replaceAll("#", "");
    // convert the hex string to an integer
    int hexInt = int.parse(hex, radix: 16);
    // create a color object from the integer value
    return Color(hexInt);
  }
}