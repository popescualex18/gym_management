import 'package:flutter/material.dart';
import 'package:gym_management/features/user/models/user_model.dart';
import 'package:gym_management/features/user/widgets/user_form.dart';
import 'package:gym_management/widgets/base_manage_entity.dart';

class ManageUserPage extends BaseManageEntity {
  final UserModel? user;
  final bool viewMode;
  const ManageUserPage({
    super.key,
    required super.title,
    this.user,
    this.viewMode = false,
  });

  @override
  Widget content(BuildContext context) {
    return UserForm(
      user: user,
      viewMode: viewMode,
    );
  }
}
