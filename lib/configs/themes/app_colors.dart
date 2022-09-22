import 'package:flutter/material.dart';
import 'package:quiz_app_futter3/configs/themes/ui_parameters.dart';
import 'app_dark_theme.dart';
import 'app_light_theme.dart';

const Color onSurfaceTextColor = Colors.white;

const mainGradientLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [primaryLightColorLight, primaryColorLight],
);

const mainGradientDark = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [primaryDarkColorDark, primaryColorDark],
);

LinearGradient mainGradient(BuildContext context) {
  return UIParameters.isDarkMode(context) ? mainGradientDark : mainGradientLight;
}
