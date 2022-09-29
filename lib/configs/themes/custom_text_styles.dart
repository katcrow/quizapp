import 'package:flutter/material.dart';
import 'package:quiz_app_futter3/configs/themes/app_colors.dart';
import 'package:quiz_app_futter3/configs/themes/ui_parameters.dart';

TextStyle cardTitles(context) => TextStyle(
      color: UIParameters.isDarkMode()
          ? Theme.of(context).textTheme.bodyText1!.color
          : Theme.of(context).primaryColor,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    );

const detailText = TextStyle(fontSize: 12.0);
const headerText = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.w700,
  color: onSurfaceTextColor,
);
