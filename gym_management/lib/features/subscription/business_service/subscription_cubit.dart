import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_management/constants/core/state.dart';
import 'package:gym_management/widgets/base_overview_widget.dart';

class SubscriptionCubit extends BaseCubit {
  SubscriptionCubit() : super(const BusyState());
  @override
  void onDispose() {
    emit(EmptyState());
  }

  @override
  void onInit() {
    emit(BusyState());
    Future.delayed(Duration(seconds: 1), () =>emit(EmptyState()));
  }
}