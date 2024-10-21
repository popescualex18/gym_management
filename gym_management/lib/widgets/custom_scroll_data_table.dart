import 'package:flutter/material.dart';
import 'package:gym_management/core/table_display.dart';
import 'package:gym_management/utils/data_table.dart';

class CustomScrollableTable<T extends TableDisplay> extends StatelessWidget {
  final List<T> data;
  final CustomDataTable<T> customDataTable;

  const CustomScrollableTable({
    super.key,
    required this.data,
    required this.customDataTable,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTableHeader(context),
        Expanded(
          child: SingleChildScrollView(
            child: _buildTableBody(context),
          ),
        ),
      ],
    );
  }

  Widget _buildTableHeader(BuildContext context) {
    return Table(
      columnWidths: customDataTable.buildColumnWidths(),
      children: [
        TableRow(
          children: customDataTable.buildHeaderCells(context),
        ),
      ],
    );
  }

  Widget _buildTableBody(BuildContext context) {
    return Table(
      columnWidths: customDataTable.buildColumnWidths(),
      children: List.generate(
        data.length,
        (index) => _buildDataRow(data[index], context),
      ),
    );
  }

  TableRow _buildDataRow(T item, BuildContext context) {
    return TableRow(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      children: customDataTable.rowBuilder(context, item),
    );
  }
}
