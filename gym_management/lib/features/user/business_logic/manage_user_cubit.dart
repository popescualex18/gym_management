import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_management/constants/core/state.dart';
import 'package:gym_management/features/subscription/models/subscription_model.dart';
import 'package:gym_management/features/user/models/user_model.dart';

class ManageUserCubit extends Cubit<BaseState> {
  ManageUserCubit() : super(const EmptyState());

  Future<void> handleChanges(UserModel model) async {
    emit(const ActionState());
    Future.delayed(
      const Duration(seconds: 1),
          () {
        final errorMessage = validationMessage(model);
        if (errorMessage != null) {
          emit(
            ErrorState(errorMessage),
          );
          return;
        }
        var index = dummyUsers.indexWhere((x) => x.id == model.id);
        if (index == -1) {
          dummyUsers.add(model);
        } else {
          dummyUsers[index] = model;
        }
        emit(
          const SuccessState(),
        );
      },
    );
  }

  String? validationMessage(UserModel model) {
    if (model.name.length <= 3) {
      return "Name should be at least 3 characters";
    }

    return null;
  }
}
