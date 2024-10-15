import 'package:flutter/material.dart';
import 'package:gym_management/utils/screen_size_helper.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      ScreenSizeHelper.getScreenSize(context).width < 600;

  static bool isBigMobile(BuildContext context) =>
      ScreenSizeHelper.getScreenSize(context).width > 600 &&
          ScreenSizeHelper.getScreenSize(context).width < 800;

  static bool isTablet(BuildContext context) =>
      ScreenSizeHelper.getScreenSize(context).width < 1100 &&
          ScreenSizeHelper.getScreenSize(context).width >= 800;

  static bool isDesktop(BuildContext context) =>
      ScreenSizeHelper.getScreenSize(context).width >= 1024;

  @override
  Widget build(BuildContext context) {
    final Size size = ScreenSizeHelper.getScreenSize(context);
    // If our width is more than 1100 then we consider it a desktop
    if (size.width >= 1024) {
      return desktop;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (size.width >= 850 && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
