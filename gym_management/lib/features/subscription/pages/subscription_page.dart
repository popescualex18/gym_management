import 'package:flutter/material.dart';
import 'package:gym_management/constants/ui/style_contstants.dart';
import 'package:gym_management/features/subscription/business_service/subscription_cubit.dart';
import 'package:gym_management/features/subscription/models/subscription_model.dart';
import 'package:gym_management/utils/data_table.dart';
import 'package:gym_management/widgets/base_overview_widget.dart';

class SubscriptionPage extends BaseOverviewWidget<SubscriptionCubit> {
  const SubscriptionPage({super.key});
  final CustomDataTable customDataTable  = const CustomDataTable();
  @override
  Widget content(BuildContext context) {
    return SingleChildScrollView(
      //scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: double.infinity,
        child: DataTable(
          horizontalMargin: 0,
          columnSpacing: StyleConstants.defaultPadding,
          columns: customDataTable.columnBuilder(SubscriptionModel.columns),
          rows: List.generate(
            dummySubscriptions.length,
            (index) => recentUserDataRow(dummySubscriptions[index], context),
          ),
        ),
      ),
    );
  }

  DataRow recentUserDataRow(SubscriptionModel userInfo, BuildContext context) {
    return customDataTable.rowBuilder(
      SubscriptionModel.columns,
      userInfo.toJson(),
      cellOverrides: {
        'id': DataCell(
          Center(
            child: Text(
              userInfo.id,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      },
    );
  }
}
