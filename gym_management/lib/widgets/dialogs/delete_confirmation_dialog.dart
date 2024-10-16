import 'package:flutter/material.dart';

class DeleteConfirmationDialog extends StatelessWidget {

  final VoidCallback onDelete;

  const DeleteConfirmationDialog({
    super.key,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Column(
          children: [
            Icon(Icons.warning_outlined, size: 36, color: Colors.red),
            SizedBox(height: 20),
            Text("Confirm Deletion"),
          ],
        ),
      ),
      content: SizedBox(
        height: 70,
        child: Column(
          children: [
            const Text("Are you sure you want to delete this?"),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.close, size: 14),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  label: const Text("Cancel"),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  icon: const Icon(Icons.delete, size: 14),
                  onPressed: onDelete, // Call the delete function
                  label: const Text("Delete"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
