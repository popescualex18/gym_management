import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_management/constants/ui/style_contstants.dart';
import 'package:gym_management/features/login/business_logic/login_cubit.dart';
import 'package:gym_management/widgets/input_widget.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: StyleConstants.bgColor,
      child: Center(
        child: Card(
          color: StyleConstants.bgColor,
          child: Container(
            padding: const EdgeInsets.all(42),
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height / 1.2,
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InputWidget(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    onChanged: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (String? value) {
                      return (value != null && value.contains('@'))
                          ? 'Do not use the @ char.'
                          : null;
                    },
                    topLabel: "Email",
                    hintText: "Enter E-mail",
                    // prefixIcon: FlutterIcons.chevron_left_fea,
                  ),
                  SizedBox(height: 8.0),
                  InputWidget(
                    topLabel: "Password",
                    obscureText: true,
                    hintText: "Enter Password",
                    onSaved: (String? uPassword) {},
                    onChanged: (String? value) {},
                    validator: (String? value) {},
                  ),
                  SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: context.read<LoginCubit>().login,
                    child: Text(
                      "Login",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
