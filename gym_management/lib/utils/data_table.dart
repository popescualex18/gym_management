import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gym_management/constants/ui/style_contstants.dart';
import 'package:gym_management/features/subscription/models/subscription_model.dart';
import 'package:gym_management/widgets/dialogs/delete_confirmation_dialog.dart';

class CustomDataTable<T extends ToJson> {
  final bool addActionButtons;
  final Future<void> Function(T entity)? delete;
  final Future<void> Function(T entity)? view;
  final Map<String, DataCell> Function(T entity)? cellOverrides;
  const CustomDataTable({
    this.addActionButtons = false,
    this.delete,
    this.view,
    this.cellOverrides,
  }) : assert(
          !(addActionButtons && (delete == null || view == null)),
          'Both delete and view must be provided when addActionButtons is true',
        );

  List<DataColumn> columnBuilder(
    List<String> columns,
    BuildContext context, {
    MainAxisAlignment? headingRowAlignment,
  }) {
    final result = <DataColumn>[];
    if (addActionButtons) {
      columns = [...columns, 'actions'];
    }
    for (var column in columns) {
      result.add(
        DataColumn(
          headingRowAlignment: headingRowAlignment,
          label: Text(
            column,
          ),
        ),
      );
    }
    return result;
  }

  DataRow rowBuilder(BuildContext context, List<String> columns, T entity) {
    final entityAsJson = entity.toJson();
    final result = <DataCell>[];
    Map<String, DataCell> cellOverrideWidgets;
    if (cellOverrides != null) {
      cellOverrideWidgets = cellOverrides!(entity);
    } else {
      cellOverrideWidgets = {};
    }

    for (var column in columns) {
      if (cellOverrideWidgets.containsKey(column)) {
        result.add(cellOverrideWidgets[column]!);
        continue;
      }
      result.add(
        DataCell(
          Center(
            child: Text(
              entityAsJson[column]!.toString(),
            ),
          ),
        ),
      );
    }
    if (addActionButtons) {
      result.add(_createActionButtons(context, entity));
    }
    return DataRow(
      cells: result,
    );
  }

  DataCell _createActionButtons(BuildContext context, T entity) {
    return DataCell(
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
            onPressed: () {},
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
      ),
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
