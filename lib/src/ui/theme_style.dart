import 'package:flutter/material.dart';

// SIZESs
double devWidth;
void setDeviceWidth(double val) {
  devWidth = val;
}

double getFontSizeMain() {
  if (devWidth > 900) return 20.0;
  if (devWidth > 400) return 15.0;
  return 12.0;
}

double getFontSizeForm() {
  if (devWidth > 900) return 25.0;
  if (devWidth > 400) return 20.0;
  return 14.0;
}

double getFontSizeLink() {
  if (devWidth > 900) return 22.0;
  if (devWidth > 400) return 15.0;
  return 12.0;
}

double getFontSizeButton() {
  if (devWidth > 900) return 15.0;
  if (devWidth > 400) return 12.0;
  return 10.0;
}

double getFontSizeThumb() {
  if (devWidth > 900) return 15.0;
  if (devWidth > 400) return 10.5;
  return 10.0;
}

double getIconSize() {
  if (devWidth > 900) return 50.0;
  if (devWidth > 400) return 40.0;
  return 30.0;
}

ThemeData meThemeData() {
  return ThemeData(
    primarySwatch: Colors.red,
    backgroundColor: Colors.black,
    canvasColor: Colors.black,
//    scaffoldBackgroundColor: Colors.black,
    fontFamily: "Arial",
  );
}

// Buttons

FlatButton linkButton(String label, Function fnc) {
  return FlatButton(
    child: Text(
      label,
      textAlign: TextAlign.center,
      style: linkButtonText(),
    ),
    onPressed: fnc,
  );
}

RaisedButton mainButton(String label, Function fnc) {
  return RaisedButton(
    child: Text(
      label,
      style: buttonText(),
    ),
    onPressed: fnc,
    color: Colors.red,
  );
}

IconButton mainIconButton({Icon icon, String tip, Function fnc}) {
  return IconButton(
    icon: icon,
    tooltip: tip,
    highlightColor: Colors.white,
    onPressed: fnc,
    color: Colors.red,
    iconSize: getIconSize(),
  );
}

// Set styles
TextStyle mainText() {
  return TextStyle(
      color: Colors.white, fontFamily: 'Arial', fontSize: getFontSizeMain());
}

TextStyle formText() {
  return TextStyle(
    color: Colors.white,
    fontFamily: 'Arial',
    fontSize: getFontSizeForm(),
  );
}

TextStyle formMessageText() {
  return TextStyle(
    color: Colors.white,
    fontFamily: 'Arial',
    fontSize: getFontSizeForm(),
  );
}

TextStyle thumbText() {
  return TextStyle(
      color: Colors.white, fontFamily: 'Arial', fontSize: getFontSizeThumb());
}

TextStyle titleText() {
  return TextStyle(
      color: Colors.white,
      fontFamily: 'Trajan Pro',
      fontSize: 20.0,
      fontWeight: FontWeight.bold);
}

TextStyle thumbTitleText() {
  return TextStyle(
      color: Colors.red,
      fontFamily: 'Arial',
      fontSize: 12.0,
      fontWeight: FontWeight.bold);
}

TextStyle linkButtonText() {
  return TextStyle(
      color: Colors.blue,
      fontFamily: 'Trajan Pro',
      fontSize: getFontSizeLink());
}

TextStyle buttonText() {
  return TextStyle(
      color: Colors.white,
      fontFamily: 'Trajan Pro',
      fontSize: getFontSizeButton());
}
