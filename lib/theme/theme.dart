import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'values/colors.dart';

const ButtonThemeData _buttonThemeData = ButtonThemeData(
  height: 42.0,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6.0))),
  buttonColor: colorPrimary,
  textTheme: ButtonTextTheme.primary,
);


ColorScheme _colorScheme = const ColorScheme(
    primary: colorPrimary,
    secondary: colorSecondary,
    background: colorBackground,
    error: colorError,
    brightness: Brightness.light,
    onBackground: colorOnBackground,
    onError: colorOnError,
    onPrimary: colorOnPrimary,
    onSecondary: colorOnSecondary,
    onSurface: colorOnSurface,
    secondaryVariant: colorSecondary,
    primaryVariant: colorPrimary,
    surface: colorSurface
);


AppBarTheme _appBarTheme= const AppBarTheme(
    iconTheme: IconThemeData(
        color: colorTextPrimary
    ),
);


ThemeData buildTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    colorScheme: _colorScheme,
    primaryColor: colorPrimary,
    appBarTheme: _appBarTheme,
    errorColor: colorError,
    focusColor: colorPrimary,

    textSelectionTheme:TextSelectionThemeData(
      cursorColor: colorTextSecondary,
      selectionColor: colorPrimary.withOpacity(0.3),
      selectionHandleColor: colorPrimary
    ),
    scaffoldBackgroundColor: colorBackground,
    backgroundColor: colorBackground,
    toggleableActiveColor: colorSecondary,
    unselectedWidgetColor: colorSecondary,
    buttonTheme: _buttonThemeData,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      },
    ),
  );
}
