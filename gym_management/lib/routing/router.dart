import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_management/constants/core/state.dart';
import 'package:gym_management/features/dashboard/business_logic/dashboard_cubit.dart';
import 'package:gym_management/features/dashboard/pages/dashboard_page.dart';
import 'package:gym_management/features/login/business_logic/login_cubit.dart';
import 'package:gym_management/features/login/pages/login_page.dart';
import 'package:gym_management/features/subscription/pages/subscription_page.dart';
import 'package:gym_management/features/user/pages/users_overview_page.dart';
import 'package:gym_management/routing/pages.dart';
import 'package:gym_management/utils/unsaved_changes_helper.dart';

class RouterCubit extends Cubit<BaseState> {
  RouterCubit() : super(const BusyState()) {
    _initRoutes();
    initState();
  }

  Map<RoutesEnum, RouteSetting> _routes = {};

  void _initRoutes() {
    _routes = {
      RoutesEnum.login: RouteSetting(
        route: RoutesEnum.login,
        page: const LoginPage(),
      ),
      RoutesEnum.dashboard: RouteSetting(
        route: RoutesEnum.dashboard,
        page: const DashboardPage(),
      ),
      RoutesEnum.subscription: RouteSetting(
        route: RoutesEnum.subscription,
        page: const SubscriptionPage(),
      ),
      RoutesEnum.user: RouteSetting(
        route: RoutesEnum.user,
        page: const UsersOverviewPage(),
      )
    };
  }

  void initState() {
    final isAuthenticated = true;
    if (isAuthenticated) {
      emit(
        DataState<RouteSetting>(
          _routes[RoutesEnum.dashboard]!,
        ),
      );
      return;
    }
    emit(
      DataState<RouteSetting>(
        _routes[RoutesEnum.login]!,
      ),
    );
  }

  void navigate(
    RoutesEnum page,
  ) {
    emit(
      DataState(
        _routes[page]!,
      ),
    );
  }

  bool isSelected(RoutesEnum route) {
    var currentScreen = state as DataState<RouteSetting>;
    return currentScreen.data.route == route;
  }
}
