import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputStyles{
  static InputDecoration inputGeneral(hintText,labelText){
    return InputDecoration(
        counterText: "",
        hintText: hintText,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.w400,overflow: TextOverflow.ellipsis),
        fillColor: Colors.white.withOpacity(0.1),

        filled: true,
        focusColor: Colors.white.withOpacity(0.5),
        contentPadding: const EdgeInsets.only(left: 10,right: 10,top:20,bottom: 20),
        labelText: labelText,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.7), width: 1),
        ),
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
        border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1)));
  }
}