import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_management/features/dashboard/business_logic/dashboard_cubit.dart';
import 'package:gym_management/features/login/business_logic/login_cubit.dart';
import 'package:gym_management/features/subscription/business_service/manage_subscription_cubit.dart';
import 'package:gym_management/features/subscription/business_service/subscription_cubit.dart';
import 'package:gym_management/features/user/business_logic/manage_user_cubit.dart';
import 'package:gym_management/features/user/business_logic/user_cubit.dart';
import 'package:gym_management/routing/router.dart';

class CubitProvider {
  CubitProvider._();
  static List cubits() {
    return [
      BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(
          context.read<RouterCubit>(),
        ),
      ),
      BlocProvider<DashboardCubit>(
        create: (context) => DashboardCubit(),
      ),
      BlocProvider<ManageSubscriptionCubit>(
        create: (context) => ManageSubscriptionCubit(),
      ),
      BlocProvider<SubscriptionCubit>(
        create: (context) => SubscriptionCubit(),
      ),
      BlocProvider<UserCubit>(
        create: (context) => UserCubit(),
      ),
      BlocProvider<ManageUserCubit>(
        create: (context) => ManageUserCubit(),
      ),
    ];
  }
}
