import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_management/constants/core/state.dart';
import 'package:gym_management/routing/pages.dart';
import 'package:gym_management/routing/router.dart';

class LoginCubit extends Cubit<BaseState> {
  LoginCubit(this._router)
      : super(
          const EmptyState(),
        );

  final RouterCubit _router;

  void login() {
    emit(const ActionState());
    Future.delayed(
      const Duration(seconds: 2),
      () {
        _router.navigate(RoutesEnum.dashboard);
      },
    );
  }
}
