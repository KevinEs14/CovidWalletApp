import 'package:covid_wallet_app/theme/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const titleStyle = TextStyle(
      color: colorTextPrimary,
      fontSize: 28,
      fontWeight: FontWeight.w500);

  static const commentsStyle = TextStyle(
      color: colorTextPrimary,
      fontSize: 18,
      fontWeight: FontWeight.w500);


  static const titleCardStyle = TextStyle(
      color: colorTextSecondary,
      fontSize: 32,
      fontWeight: FontWeight.w400);


  static const subtitleCardStyle = TextStyle(
      color: colorTextSecondary,
      fontSize: 16,
      fontWeight: FontWeight.w400);

  static const inputStyle= TextStyle(
      color: colorTextSecondary,
      fontSize: 18,
      fontWeight: FontWeight.w600);

  static const textButtonStyle= TextStyle(
      color: colorTextPrimary,
      fontSize: 18,
      fontWeight: FontWeight.w600);
  static const textButtonFillStyle= TextStyle(
      color: colorTextSecondary,
      fontSize: 18,
      fontWeight: FontWeight.w600);
}