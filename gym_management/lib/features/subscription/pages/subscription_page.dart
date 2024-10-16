import 'package:flutter/material.dart';
import 'package:gym_management/features/subscription/business_service/subscription_cubit.dart';
import 'package:gym_management/features/subscription/widgets/subscription_widget.dart';
import 'package:gym_management/widgets/base_overview_widget.dart';
class SubscriptionPage extends BaseOverviewWidget<SubscriptionCubit> {
  const SubscriptionPage({
    super.key,
  });

  @override
  Widget content(BuildContext context) {
    return const SubscriptionWidget();
  }
}
