import 'package:flutter/material.dart';

class UnsavedChangesHelper {
  UnsavedChangesHelper._();
  static void showExitConfirmationDialog(
      BuildContext context, Function(bool value) callback) async {
    showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Unsaved Changes'),
        content: const Text(
            'You have unsaved changes. Do you want to discard them?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true); // Return true to allow exit
            },
            child: const Text('Discard'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Return false to cancel exit
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    ).then(
      (value) => callback(value ?? true),
    );
  }
}
