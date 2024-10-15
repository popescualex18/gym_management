import 'package:flutter/material.dart';

class RouteSetting {
  final RoutesEnum route;
  final Widget page;
  RouteSetting({
    required this.route,
    required this.page,
  });

  bool hasChanges(BuildContext context) {
    if (page is OnExit) {
      return (page as OnExit).hasChanges(context);
    }
    return false;
  }
}

abstract class OnExit {
  bool hasChanges(BuildContext context);
}

enum RoutesEnum {
  login,
  dashboard,
  subscription,
}
