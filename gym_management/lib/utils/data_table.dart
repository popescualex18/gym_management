import 'package:flutter/material.dart';
import 'package:gym_management/constants/ui/style_contstants.dart';

class CustomDataTable {
  final bool addActionButtons;

  // Private named constructor
  const CustomDataTable({this.addActionButtons = true});

  List<DataColumn> columnBuilder(List<String> columns) {
    final result = <DataColumn>[];
    if (addActionButtons) {
      columns = [...columns, 'actions'];
    }
    for (var column in columns) {
      result.add(
        DataColumn(
          headingRowAlignment: MainAxisAlignment.center,
          label: Text(
            column,
          ),
        ),
      );
    }
    return result;
  }

  DataRow rowBuilder(
    List<String> columns,
    Map<String, dynamic> entity, {
    Map<String, DataCell>? cellOverrides,
  }) {
    final result = <DataCell>[];
    cellOverrides = cellOverrides ?? {};
    for (var column in columns) {
      if (cellOverrides.containsKey(column)) {
        result.add(cellOverrides[column]!);
        continue;
      }
      result.add(
        DataCell(
          Center(
            child: Text(
              entity[column]!.toString(),
            ),
          ),
        ),
      );
    }
    if (addActionButtons) {
      result.add(_createActionButtons());
    }
    return DataRow(
      cells: result,
    );
  }

  static DataCell _createActionButtons() {
    return DataCell(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            child: Text('View',
                style: TextStyle(color: StyleConstants.primaryColor)),
            onPressed: () {},
          ),
          SizedBox(
            width: 6,
          ),
          TextButton(
            child: Text("Delete", style: TextStyle(color: Colors.redAccent)),
            onPressed: () {},
            // Delete
          ),
        ],
      ),
    );
  }
}
