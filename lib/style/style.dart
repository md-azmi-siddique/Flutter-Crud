import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const colorRed = Color.fromARGB(231, 28, 36, 1);
const colorGreen = Colors.green;
const colorWhite = Colors.white;
const colorBlack = Colors.black;

ScreenBackground(context){
  return SvgPicture.asset('assets/images/image.svg',
  alignment: Alignment.center,
  width: MediaQuery.of(context).size.width,
  height: MediaQuery.of(context).size.height,
  fit: BoxFit.cover,);

}

InputDecoration AppInputDecoration(label) {
  return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colorGreen,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colorWhite,
          width: 0,
        ),
      ),
      border: OutlineInputBorder(),
      labelText: label,
      fillColor: colorWhite,
      filled: true,
      contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
  );
}

DecoratedBox AppDropDown(child){
  return DecoratedBox(decoration: BoxDecoration(
    color: colorWhite,
    border: Border.all(color: colorWhite, width: 1),
    borderRadius: BorderRadius.circular(4),
  ),
    child: Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: child,
    )
    // child: child,
  );
}