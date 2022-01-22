import 'package:covid_wallet_app/theme/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static final _style=GoogleFonts.jost();
  static final titleStyle = _style.copyWith(
      color: colorTextPrimary,
      fontSize: 28,

      fontWeight: FontWeight.w500);

  static final titleSecondStyle = _style.copyWith(
      color: colorTextSecondary,
      fontSize: 28,
      fontWeight: FontWeight.w500);
  static final commentsStyle = _style.copyWith(
      color: colorTextPrimary,
      fontSize: 16,
      fontWeight: FontWeight.w500);


  static final titleCardStyle = _style.copyWith(
      color: colorTextSecondary,
      fontSize: 32,
      fontWeight: FontWeight.w400);


  static final subtitleCardStyle = _style.copyWith(
      color: colorTextSecondary,
      fontSize: 16,
      fontWeight: FontWeight.w400);

  static final inputStyle= _style.copyWith(
      color: colorTextSecondary,
      fontSize: 18,
      fontWeight: FontWeight.w600);

  static final textButtonStyle= _style.copyWith(
      color: colorTextPrimary,
      fontSize: 18,
      fontWeight: FontWeight.w600);
  static final textButtonFillStyle= _style.copyWith(
      color: colorTextSecondary,
      fontSize: 18,
      fontWeight: FontWeight.w600);

  static var indicatorStyle = _style.copyWith(
      color: colorTextPrimary.withOpacity(0.7),
      fontSize: 14,
      fontWeight: FontWeight.w500);

  static final  textErrorStyle =  _style.copyWith(
      color: colorError,
      fontSize: 16,
      fontWeight: FontWeight.w500);

  static final  textSuccessStyle =  _style.copyWith(
      color: colorPrimary,
      fontSize: 16,
      fontWeight: FontWeight.w500);
}