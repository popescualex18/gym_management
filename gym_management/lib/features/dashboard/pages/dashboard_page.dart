import 'package:flutter/cupertino.dart';
import 'package:gym_management/features/dashboard/business_logic/dashboard_cubit.dart';
import 'package:gym_management/routing/pages.dart';
import 'package:gym_management/widgets/base_overview_widget.dart';

class DashboardPage extends BaseOverviewWidget<DashboardCubit>
    implements OnExit {
  const DashboardPage({
    super.key,
  }) : super(
          showAddButton: false,
        );

  @override
  Widget content(BuildContext context) {
    return const Text("Dashboard");
  }

  @override
  bool hasChanges(BuildContext context) {
    return false;
  }
}
