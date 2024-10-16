import 'package:gym_management/constants/core/state.dart';
import 'package:gym_management/features/subscription/models/subscription_model.dart';
import 'package:gym_management/widgets/base_overview_widget.dart';

class SubscriptionCubit extends BaseCubit {
  SubscriptionCubit() : super(const BusyState());

  List<SubscriptionModel> data = [];

  @override
  void onDispose() {
    emit(const EmptyState());
  }

  @override
  void onInit() {
    emit(const BusyState());
    Future.delayed(
      const Duration(seconds: 1),
      () {
        data = dummySubscriptions;
        emit(
          DataState(dummySubscriptions),
        );
      },
    );
  }

  Future<void> delete(SubscriptionModel model) async {
    emit(const ActionState());
    Future.delayed(
      const Duration(seconds: 1),
      () {
        dummySubscriptions.remove(
          model,
        );
        data = dummySubscriptions;
        emit(
          DataState(dummySubscriptions),
        );
      },
    );
  }
}
