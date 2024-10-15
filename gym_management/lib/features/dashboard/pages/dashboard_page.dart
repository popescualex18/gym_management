import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_management/features/dashboard/business_logic/dashboard_cubit.dart';
import 'package:gym_management/routing/pages.dart';
import 'package:gym_management/widgets/base_widget.dart';

class DashboardPage extends BaseWidget<DashboardCubit> implements OnExit {
  const DashboardPage({super.key});

  @override
  Widget content(BuildContext context) {
    return Text("Dashboard");
  }

  @override
  bool hasChanges(BuildContext context) {
    return false;
  }
}
