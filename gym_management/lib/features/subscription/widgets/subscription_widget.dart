import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_management/constants/core/state.dart';
import 'package:gym_management/constants/ui/style_contstants.dart';
import 'package:gym_management/features/subscription/business_service/subscription_cubit.dart';
import 'package:gym_management/features/subscription/models/subscription_model.dart';
import 'package:gym_management/utils/data_table.dart';
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
      addActionButtons: true,
      delete: cubit.delete,
      view: (_) async {},
      cellOverrides: (entity) => {
        'id': DataCell(
          Center(
            child: Text(
              entity.id,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      }
    );

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final data = context.watch<SubscriptionCubit>().data;
    return SizedBox(
      width: double.infinity,
      child: CustomScrollableDataTable(
        data: data,
        customDataTable: customDataTable,
      ),
    );
  }
}
