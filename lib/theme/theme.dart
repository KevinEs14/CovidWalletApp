import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'values/colors.dart';

const ButtonThemeData _buttonThemeData = ButtonThemeData(
  height: 42.0,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6.0))),
  buttonColor: colorPrimary,
  textTheme: ButtonTextTheme.primary,
);

const InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
  alignLabelWithHint: false,
  border: UnderlineInputBorder(),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFbbbbbb)),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: colorSecondary),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  disabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFf6f6f6), width: 2),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
  contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
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
    cardColor: colorSurface,
    scaffoldBackgroundColor: colorBackground,
    backgroundColor: colorBackground,
    toggleableActiveColor: colorSecondary,
    unselectedWidgetColor: colorSecondary,
    buttonTheme: _buttonThemeData,
    inputDecorationTheme: _inputDecorationTheme,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      },
    ),
  );
}
