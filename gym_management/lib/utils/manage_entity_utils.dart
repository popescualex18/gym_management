import 'package:flutter/material.dart';

class ManageEntityUtils {
  ManageEntityUtils._();

  static Future<void> show(
    BuildContext context,
    Widget content, {
    Function()? callback,
  }) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => content,
      ),
    );
    callback?.call();
  }
}
