import 'package:flutter/material.dart';
import 'package:gym_management/constants/ui/style_contstants.dart';
import 'package:gym_management/features/subscription/models/subscription_model.dart';
import 'package:gym_management/utils/data_table.dart';

class CustomScrollableDataTable<T extends ToJson> extends StatelessWidget {
  final List<T> data;
  final CustomDataTable<T> customDataTable;
  const CustomScrollableDataTable({
    super.key,
    required this.data,
    required this.customDataTable,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: DataTable(
            showBottomBorder: true,
            columnSpacing: StyleConstants.defaultPadding,
            columns: customDataTable.columnBuilder(
              SubscriptionModel.columns,
              context,
              headingRowAlignment: MainAxisAlignment.center
            ),
            rows: const [], // No rows in the header, it's just for the columns
          ),
        ),
        // Scrollable table body
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
              width: double.infinity, // Keep width aligned with header
              child: DataTable(
                showBottomBorder: true,
                headingRowHeight: 0,
                columns: customDataTable.columnBuilder(
                  SubscriptionModel.columns,
                  context,
                  headingRowAlignment: MainAxisAlignment.end
                ),
                rows: List.generate(
                  data.length,
                  (index) => _buildDataRows(data[index], context),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  DataRow _buildDataRows(T data, BuildContext context) {
    return customDataTable.rowBuilder(
      context,
      SubscriptionModel.columns,
      data,
    );
  }
}
