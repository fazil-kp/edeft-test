import 'package:flutter/material.dart';

const blueColor = Color(0xff1ab1dc);
// const redColor = Color(0xfff1323a);
// const greenColor = Color(0xff3ad5b6);
// typedef MapS = Map<String, dynamic>;
const Color primaryColor = Color.fromARGB(255, 227, 60, 60);

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

class ConstanceData {
  static const Color primaryColor = Color.fromARGB(255, 227, 60, 60);

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}

class ScreenDetails {
  static const double webViewLimit = 700;
  static bool isWebLimit(MediaQueryData of) {
    return (webViewLimit > of.size.width);
  }
}

const cHeight8 = SizedBox(height: 8);
const cHeight10 = SizedBox(height: 10);
const cHeight20 = SizedBox(height: 20);

const cWidth5 = SizedBox(width: 5);
const cWidth8 = SizedBox(width: 8);
const cWidth10 = SizedBox(width: 10);
const cWidth20 = SizedBox(width: 20);
const cWidth40 = SizedBox(width: 40);
