import 'package:flutter/cupertino.dart';
import 'package:gym_management/features/login/business_logic/login_cubit.dart';
import 'package:gym_management/features/login/widgets/login_container.dart';
import 'package:gym_management/widgets/state_handler.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const StateHandler<LoginCubit>(
      child: LoginContainer(),
    );
  }
}
