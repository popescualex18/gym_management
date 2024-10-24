import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_management/features/subscription/business_service/subscription_cubit.dart';
import 'package:gym_management/features/subscription/models/subscription_model.dart';
import 'package:gym_management/features/subscription/pages/manage_subscription_page.dart';
import 'package:gym_management/utils/data_table.dart';
import 'package:gym_management/utils/manage_entity_utils.dart';
import 'package:gym_management/widgets/custom_scroll_data_table.dart';

class SubscriptionWidget extends StatefulWidget {
  const SubscriptionWidget({super.key});

  @override
  State<SubscriptionWidget> createState() => _SubscriptionWidgetState();
}

class _SubscriptionWidgetState extends State<SubscriptionWidget> {
  late final CustomDataTable customDataTable;
  late final SubscriptionCubit cubit;

  @override
  void initState() {
    cubit = context.read<SubscriptionCubit>();
    customDataTable = CustomDataTable<SubscriptionModel>(
      columns: SubscriptionModel.columns,
      addActionButtons: true,
      delete: cubit.delete,
      view: (entity) async {
        await ManageEntityUtils.show(
          context,
          ManageSubscriptionPage(
            title: "View",
            subscription: entity,
            viewMode: true,
          ),
        );
      },
      edit: (entity) async {
        await ManageEntityUtils.show(
          context,
          ManageSubscriptionPage(
            title: "Edit",
            subscription: entity,
          ),
          callback: cubit.onInit,
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = context.watch<SubscriptionCubit>().data;
    return CustomScrollableTable(
      data: data,
      customDataTable: customDataTable,
    );
  }
}
