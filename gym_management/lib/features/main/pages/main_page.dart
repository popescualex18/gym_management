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
import 'package:gym_management/features/subscription/business_service/subscription_cubit.dart';
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // We want this side menu only for large screen
        if (Responsive.isDesktop(context))
          const Expanded(
            // default flex = 1
            // and it takes 1/6 part of the screen
            child: SideMenuPage(),
          ),
        Expanded(
          // It takes 5/6 part of the screen
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(StyleConstants.defaultPadding),
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                children: [
                  const SizedBox(height: StyleConstants.defaultPadding),
                  page.data.page
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
