import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_management/constants/core/state.dart';
import 'package:gym_management/routing/pages.dart';
import 'package:gym_management/widgets/base_widget.dart';

class DashboardCubit extends BaseCubit {
  DashboardCubit(): super(const BusyState());


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