import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gym_management/constants/ui/style_contstants.dart';
import 'package:gym_management/core/table_display.dart';
import 'package:gym_management/widgets/dialogs/delete_confirmation_dialog.dart';

class CustomDataTable<T extends TableDisplay> {
  final bool addActionButtons;
  final List<String> columns;
  final Future<void> Function(T entity)? delete;
  final Future<void> Function(T entity)? view;
  final Future<void> Function(T entity)? edit;
  CustomDataTable({
    required this.columns,
    this.addActionButtons = false,
    this.delete,
    this.view,
    this.edit,
  }) : assert(
          !(addActionButtons && (delete == null || view == null)),
          'Both delete and view must be provided when addActionButtons is true',
        );

  final Map<int, TableColumnWidth> _columnWidths = {};

  Map<int, TableColumnWidth> buildColumnWidths() {
    if(_columnWidths.isNotEmpty) {
      return _columnWidths;
    }
    final updatedColumns = [...columns];
    if (addActionButtons) {
      updatedColumns.add('actions');
    }
    for (int i = 0; i < updatedColumns.length; i++) {
      _columnWidths[i] = const FlexColumnWidth(4);
    }
    return _columnWidths;
  }

  List<Widget> buildHeaderCells(
    BuildContext context,
  ) {
    final result = <Widget>[];
    final updatedColumns = [...columns];
    if (addActionButtons) {
      updatedColumns.add('actions');
    }
    for (var column in updatedColumns) {
      result.add(
        _buildCellText(column),
      );
    }
    return result;
  }

  Widget _buildCellText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: Text(
          text,
        ),
      ),
    );
  }

  List<Widget> rowBuilder(BuildContext context, T entity) {
    final entityAsJson = entity.toTableData();
    final result = <Widget>[];

    for (var column in columns) {

      result.add(
        _buildCellText(entityAsJson[column]!.toString(),),

      );
    }
    if (addActionButtons) {
      result.add(_createActionButtons(context, entity));
    }
    return result;
  }

  Widget _createActionButtons(BuildContext context, T entity) {
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            child: const Text(
              'View',
              style: TextStyle(
                color: StyleConstants.primaryColor,
              ),
            ),
            onPressed: () async {
              await this.view!(entity);
            },
          ),
          const SizedBox(
            width: 6,
          ),
          TextButton(
            child: const Text(
              'Edit',
              style: TextStyle(
                color: StyleConstants.primaryColor,
              ),
            ),
            onPressed: () async {
              await this.edit!(entity);
            },
          ),
          const SizedBox(
            width: 6,
          ),
          TextButton(
            child: const Text(
              "Delete",
              style: TextStyle(
                color: Colors.redAccent,
              ),
            ),
            onPressed: () {
              _showDeleteConfirmationDialog(context, entity);
            },
            // Delete
          ),
        ],
      );
  }

  void _showDeleteConfirmationDialog(
    BuildContext context,
    T entity,
  ) {
    showDialog(
      context: context,
      builder: (_) {
        return DeleteConfirmationDialog(onDelete: () {
          unawaited(
            this.delete!(entity),
          );
          Navigator.of(context).pop();
        });
      },
    );
  }
}
