import 'package:flutter/material.dart';
import 'package:gym_management/features/subscription/models/subscription_model.dart';
import 'package:gym_management/features/subscription/widgets/subscription_form.dart';
import 'package:gym_management/widgets/base_manage_entity.dart';

class ManageSubscriptionPage extends BaseManageEntity {
  final SubscriptionModel? subscription;
  final bool viewMode;
  const ManageSubscriptionPage({
    super.key,
    required super.title,
    this.subscription,
    this.viewMode = false,
  });

  @override
  Widget content(BuildContext context) {
    return SubscriptionForm(
      subscription: subscription,
      viewMode: viewMode,
    );
  }
}
