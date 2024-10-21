import 'package:gym_management/constants/core/state.dart';
import 'package:gym_management/features/user/models/user_model.dart';
import 'package:gym_management/widgets/base_overview_widget.dart';

class UserCubit extends BaseCubit {
  UserCubit(): super(const BusyState());

  List<UserModel> data = [];

  @override
  void onInit() {
    emit(const BusyState());
    Future.delayed(
      const Duration(seconds: 1),
          () {
        data = dummyUsers;
        emit(
          DataState(dummyUsers),
        );
      },
    );
  }
  Future<void> delete(UserModel model) async {
    emit(const ActionState());
    Future.delayed(
      const Duration(seconds: 1),
          () {
            dummyUsers.remove(
          model,
        );
        data = dummyUsers;
        emit(
          DataState(dummyUsers),
        );
      },
    );
  }
}