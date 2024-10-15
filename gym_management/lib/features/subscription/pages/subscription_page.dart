import 'package:flutter/material.dart';
import 'package:gym_management/constants/ui/style_contstants.dart';
import 'package:gym_management/features/subscription/business_service/subscription_cubit.dart';
import 'package:gym_management/features/subscription/models/subscription_model.dart';
import 'package:gym_management/utils/data_table.dart';
import 'package:gym_management/widgets/base_widget.dart';

class SubscriptionPage extends BaseWidget<SubscriptionCubit> {
  const SubscriptionPage({super.key});

  @override
  Widget content(BuildContext context) {
    return SingleChildScrollView(
      //scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: double.infinity,
        child: DataTable(
          horizontalMargin: 0,
          columnSpacing: StyleConstants.defaultPadding,
          columns: CustomDataTable.columnBuilder(['id','name', 'price', 'actions']),
          rows: List.generate(
            dummySubscriptions.length,
                (index) => recentUserDataRow(dummySubscriptions[index], context),
          ),
        ),
      ),
    );
  }
  DataRow recentUserDataRow(SubscriptionModel userInfo, BuildContext context) {
    return DataRow(
      cells: [
        DataCell(
          Text(
            userInfo.id!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        DataCell(Text(userInfo.name!)),
        DataCell(Text(userInfo.price!.toString())),
        DataCell(
          Row(
            children: [
              TextButton(
                child: Text(
                    'View', style: TextStyle(color: StyleConstants.primaryColor)),
                onPressed: () {},
              ),
              SizedBox(
                width: 6,
              ),
              TextButton(
                child: Text(
                    "Delete", style: TextStyle(color: Colors.redAccent)),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                            title: Center(
                              child: Column(
                                children: [
                                  Icon(Icons.warning_outlined,
                                      size: 36, color: Colors.red),
                                  SizedBox(height: 20),
                                  Text("Confirm Deletion"),
                                ],
                              ),
                            ),
                            content: Container(
                              height: 70,
                              child: Column(
                                children: [
                                  Text(
                                      "Are you sure want to delete '${userInfo
                                          .name}'?"),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton.icon(
                                          icon: Icon(
                                            Icons.close,
                                            size: 14,
                                          ),

                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          label: Text("Cancel")),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton.icon(
                                          icon: Icon(
                                            Icons.delete,
                                            size: 14,
                                          ),

                                          onPressed: () {},
                                          label: Text("Delete"))
                                    ],
                                  )
                                ],
                              ),
                            ));
                      });
                },
                // Delete
              ),
            ],
          ),
        ),
      ],
    );
  }
}
