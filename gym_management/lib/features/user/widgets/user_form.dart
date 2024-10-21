import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_management/features/subscription/business_service/manage_subscription_cubit.dart';
import 'package:gym_management/features/subscription/models/subscription_model.dart';
import 'package:gym_management/features/user/business_logic/manage_user_cubit.dart';
import 'package:gym_management/features/user/models/user_model.dart';
import 'package:gym_management/widgets/input_widget.dart';
import 'package:gym_management/widgets/manage_entity_form.dart';
import 'package:gym_management/widgets/state_handler.dart';

class UserForm extends StatefulWidget {
  final UserModel? user;
  final bool viewMode;
  const UserForm({
    super.key,
    required this.user,
    this.viewMode = false
  });

  @override
  State<UserForm> createState() => _SubscriptionFormState();
}

class _SubscriptionFormState extends State<UserForm> {
  late TextEditingController _idController;
  late TextEditingController _nameController;
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _idController = TextEditingController(
      text: widget.user?.id ?? '-1',
    );
    _nameController = TextEditingController(
      text: widget.user?.name,
    );

  }

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _onSave() async {
    final updatedSubscription = SubscriptionModel(
      id: _idController.text,
      name: _nameController.text,
      price: double.tryParse(_priceController.text) ?? 0.0,
    );
    context.read<ManageSubscriptionCubit>().handleChanges(updatedSubscription,);
  }

  @override
  Widget build(BuildContext context) {
    return StateHandler<ManageUserCubit>(
      child: ManageEntityForm(
        viewMode: widget.viewMode,
        fields: [
          TextField(
            controller: _idController,
            decoration: const InputDecoration(labelText: 'Id'),
          ),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
        ],
        onSave: _onSave,
      ),
    );
  }
}
