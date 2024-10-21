import 'package:flutter/material.dart';
import 'package:gym_management/features/subscription/business_service/subscription_cubit.dart';
import 'package:gym_management/features/subscription/widgets/subscription_widget.dart';
import 'package:gym_management/features/user/business_logic/user_cubit.dart';
import 'package:gym_management/features/user/pages/manage_user_page.dart';
import 'package:gym_management/features/user/widgets/users_overview_widget.dart';
import 'package:gym_management/widgets/base_overview_widget.dart';

class UsersOverviewPage extends BaseOverviewWidget<UserCubit> {
  const UsersOverviewPage({
    super.key,
  });

  @override
  Widget? onAdd(BuildContext context) {
    return const ManageUserPage(
      title: "Add user",
    );
  }

  @override
  Widget content(BuildContext context) {
    return const UsersOverviewWidget();
  }
}
