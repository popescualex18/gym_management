import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_management/constants/core/shared_keys.dart';
import 'package:gym_management/constants/core/state.dart';
import 'package:gym_management/constants/ui/style_contstants.dart';
import 'package:gym_management/features/dashboard/business_logic/dashboard_cubit.dart';
import 'package:gym_management/features/dashboard/pages/dashboard_page.dart';
import 'package:gym_management/features/login/business_logic/login_cubit.dart';
import 'package:gym_management/features/login/pages/login_page.dart';
import 'package:gym_management/features/side_menu/pages/side_menu_page.dart';
import 'package:gym_management/features/subscription/business_service/manage_subscription_cubit.dart';
import 'package:gym_management/features/subscription/business_service/subscription_cubit.dart';
import 'package:gym_management/features/user/business_logic/manage_user_cubit.dart';
import 'package:gym_management/features/user/business_logic/user_cubit.dart';
import 'package:gym_management/main.dart';
import 'package:gym_management/routing/pages.dart';
import 'package:gym_management/routing/router.dart';
import 'package:gym_management/utils/responsive.dart';
import 'package:gym_management/widgets/state_handler.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(
            context.read<RouterCubit>(),
          ),
        ),
        BlocProvider<DashboardCubit>(
          create: (context) => DashboardCubit(),
        ),
        BlocProvider<SubscriptionCubit>(
          create: (context) => SubscriptionCubit(),
        ),
        BlocProvider<ManageUserCubit>(
          create: (context) => ManageUserCubit(),
        ),
        BlocProvider<ManageSubscriptionCubit>(
          create: (context) => ManageSubscriptionCubit(),
        ),
        BlocProvider<UserCubit>(
          create: (context) => UserCubit(),
        ),
      ],
      child: StateHandler<RouterCubit>(
        child: BlocConsumer<RouterCubit, BaseState>(
          listener: (context, state) {
            // You can perform any side effects here if needed, e.g., navigation
          },
          builder: (context, state) {
            return Container(
              color: StyleConstants.bgColor,
              child: _getPage(context),
            );
          },
        ),
      ),
    );
  }

  Widget _getPage(BuildContext context) {
    final page = context.read<RouterCubit>().state as DataState<RouteSetting>;
    if (RoutesEnum.login == page.data.route) {
      return const LoginPage();
    }
    return Row(
      children: [
        Container(
          constraints: BoxConstraints(
            minWidth: 200,
            maxWidth:MediaQuery.of(context).size.width * 0.2,
          ),
          height: MediaQuery.of(context).size.height,

          child: const SideMenuPage(),
        ),
        Expanded(
          child: page.data.page,
        )
      ],
    );
  }
}
