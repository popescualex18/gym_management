import 'package:flutter/material.dart';

enum SnackBarType { success, info, error }

class SnackBarWidget {
  static SnackBar build({
    required String message,
    SnackBarType type = SnackBarType.success,
  }) {
    return SnackBar(
      backgroundColor: _getSnackBarColor(type),
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            _getSnackBarIcon(type),
            color: Colors.white,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 3),
    );
  }

  static Color _getSnackBarColor(SnackBarType type) {
    switch (type) {
      case SnackBarType.info:
        return Colors.blueGrey;
      case SnackBarType.error:
        return Colors.redAccent;
      case SnackBarType.success:
      default:
        return Colors.green;
    }
  }

  static IconData _getSnackBarIcon(SnackBarType type) {
    switch (type) {
      case SnackBarType.info:
        return Icons.info_outline;
      case SnackBarType.error:
        return Icons.error_outline;
      case SnackBarType.success:
      default:
        return Icons.check_circle_outline;
    }
  }

  static void showRightSnackBar(
      BuildContext context, String message, SnackBarType type) {
    final snackBar = SnackBarWidget.build(
      message: message,
      type: type,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: snackBar.backgroundColor,
        content: Transform.translate(
          offset: const Offset(
              150, 0), // Offset to the right (adjust this as needed)
          child: snackBar.content,
        ),
        behavior: SnackBarBehavior.floating,
        width: snackBar.width, // Same width as defined earlier
        duration: snackBar.duration,
      ),
    );
  }
}
