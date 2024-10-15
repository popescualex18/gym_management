import 'package:flutter/material.dart';
import 'package:gym_management/constants/ui/style_contstants.dart';

enum SnackBarType { success, info, error }

class SnackBarWidget {
  static SnackBar build({
    required String message,
    SnackBarType type = SnackBarType.success,
  }) {
    return SnackBar(
      backgroundColor: _getSnackBarColor(type),
      behavior: SnackBarBehavior.floating, // Makes it appear floating above the bottom bar
      content: Row(
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
}
