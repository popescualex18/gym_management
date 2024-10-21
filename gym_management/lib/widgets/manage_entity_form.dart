import 'dart:async';

import 'package:flutter/material.dart';

class ManageEntityForm extends StatelessWidget {
  final List<Widget> fields;
  final bool viewMode;
  final Future<void> Function()? onSave;
  const ManageEntityForm({
    super.key,
    required this.fields,
    this.onSave,
    this.viewMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: viewMode,
      child: Column(
        children: [
          ...fields,
          const Spacer(),
          Visibility(
            visible: !viewMode,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed:() async => await onSave?.call(),
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
