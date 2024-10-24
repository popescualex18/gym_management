import 'package:flutter/material.dart';
import 'package:gym_management/features/subscription/business_service/subscription_cubit.dart';
import 'package:gym_management/features/subscription/pages/manage_subscription_page.dart';
import 'package:gym_management/features/subscription/widgets/subscription_widget.dart';
import 'package:gym_management/widgets/base_overview_widget.dart';

class SubscriptionPage extends BaseOverviewWidget<SubscriptionCubit> {
  const SubscriptionPage({
    super.key,
  });

  @override
  Widget? onAdd(BuildContext context) {
    return const ManageSubscriptionPage(
      title: "Add subscription",
    );
  }

  @override
  Widget content(BuildContext context) {
    return const SubscriptionWidget();
  }
}
