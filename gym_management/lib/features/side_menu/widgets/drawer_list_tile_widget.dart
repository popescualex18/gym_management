import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_management/constants/core/state.dart';
import 'package:gym_management/constants/ui/style_contstants.dart';
import 'package:gym_management/features/dashboard/business_logic/dashboard_cubit.dart';
import 'package:gym_management/routing/pages.dart';
import 'package:gym_management/routing/router.dart';
import 'package:gym_management/utils/unsaved_changes_helper.dart';

class DrawerListTileWidget extends StatelessWidget {
  const DrawerListTileWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.route,
  });

  final String title;
  final IconData icon;
  final RoutesEnum route;

  @override
  Widget build(BuildContext context) {
    final isSelected = context.select<RouterCubit, bool>(
      (selector) => selector.isSelected(
        route,
      ),
    );

    return Container(
      color: isSelected ? StyleConstants.primaryColor : null,
      child: ListTile(
        onTap: () => navigate(context),
        horizontalTitleGap: StyleConstants.defaultPadding,
        leading: Icon(
          icon,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white54,
          ),
        ),
      ),
    );
  }

  void navigate(BuildContext context) {
    var currentScreen =
        context.read<RouterCubit>().state as DataState<RouteSetting>;
    if (currentScreen.data.page is! OnExit ||
        !(currentScreen.data.page as OnExit).hasChanges(context)) {
      context.read<RouterCubit>().navigate(route);
      return;
    }
    UnsavedChangesHelper.showExitConfirmationDialog(
      context,
      (canChange) {
        if (canChange) {
          context.read<RouterCubit>().navigate(route);
        }
      },
    );
  }
}
