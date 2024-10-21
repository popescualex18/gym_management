import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_management/constants/core/state.dart';
import 'package:gym_management/features/subscription/models/subscription_model.dart';

class ManageSubscriptionCubit extends Cubit<BaseState> {
  ManageSubscriptionCubit() : super(const EmptyState());

  Future<void> handleChanges(SubscriptionModel model) async {
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
        var index = dummySubscriptions.indexWhere((x) => x.id == model.id);
        if (index == -1) {
          dummySubscriptions.add(model);
        } else {
          dummySubscriptions[index] = model;
        }
        emit(
          const SuccessState(),
        );
      },
    );
  }

  String? validationMessage(SubscriptionModel model) {
    if (model.name.length <= 3) {
      return "Name should be at least 3 characters";
    }
    if (model.price <= 0.0) {
      return "Name should be at least 1.0";
    }
    return null;
  }
}
