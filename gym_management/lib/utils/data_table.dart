import 'package:flutter/material.dart';

class CustomDataTable {
  CustomDataTable._();
  static List<DataColumn> columnBuilder(List<String> columns) {
    final result = <DataColumn>[];
    for (var column in columns) {
      result.add(
        DataColumn(
          label: Text(column),
        ),
      );
    }
    return result;
  }
  static List<DataColumn> rowBuilder<T>(Map<String, T> dataSelector, {Map<String, DataRow>? cellOverrides}) {
    final result = <DataColumn>[];
    for (var column in columns) {
      result.add(
        DataColumn(
          label: Text(column),
        ),
      );
    }
    return result;
  }
}
