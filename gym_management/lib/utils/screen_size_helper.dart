import 'package:flutter/material.dart';

class ScreenSizeHelper {
  ScreenSizeHelper._();
  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
}
