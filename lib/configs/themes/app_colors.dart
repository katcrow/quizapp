import 'package:flutter/material.dart';
import 'package:quiz_app_futter3/configs/themes/ui_parameters.dart';
import 'app_dark_theme.dart';
import 'app_light_theme.dart';

const Color onSurfaceTextColor = Colors.white;

const mainGradientLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryLightColorLight,
    primaryColorLight,
  ],
);

const mainGradientDark = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryDarkColorDark,
    primaryColorDark,
  ],
);

LinearGradient mainGradient() {
  return UIParameters.isDarkMode() ? mainGradientDark : mainGradientLight;
}

Color customScaffoldColor(BuildContext context) {
  return UIParameters.isDarkMode()
      ? const Color(0xFF2e3c62)
      : const Color.fromARGB(255, 240, 237, 255);
}
