import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_management/features/subscription/business_service/subscription_cubit.dart';
import 'package:gym_management/features/user/business_logic/user_cubit.dart';
import 'package:gym_management/features/user/models/user_model.dart';
import 'package:gym_management/features/user/pages/manage_user_page.dart';
import 'package:gym_management/utils/data_table.dart';
import 'package:gym_management/utils/manage_entity_utils.dart';
import 'package:gym_management/widgets/custom_scroll_data_table.dart';

class UsersOverviewWidget extends StatefulWidget {
  const UsersOverviewWidget({super.key});

  @override
  State<UsersOverviewWidget> createState() => _UsersOverviewWidgetState();
}

class _UsersOverviewWidgetState extends State<UsersOverviewWidget> {
  late final CustomDataTable customDataTable;
  late final SubscriptionCubit subscriptionCubit;
  late final UserCubit userCubit;

  @override
  void initState() {
    subscriptionCubit = context.read<SubscriptionCubit>();
    userCubit = context.read<UserCubit>();
    customDataTable = CustomDataTable<UserModel>(
      columns: UserModel.columns,
      addActionButtons: true,
      delete: userCubit.delete,
      view: (entity) async {
        await ManageEntityUtils.show(
          context,
          ManageUserPage(
            title: "View",
            user: entity,
            viewMode: true,
          ),
        );
      },
      edit: (entity) async {
        await ManageEntityUtils.show(
          context,
          ManageUserPage(
            title: "Edit",
            user: entity,
          ),
          callback: userCubit.onInit,
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = context.watch<UserCubit>().data;
    return CustomScrollableTable(
      data: data,
      customDataTable: customDataTable,
    );
  }
}
