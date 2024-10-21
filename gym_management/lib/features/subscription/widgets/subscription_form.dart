import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_management/features/subscription/business_service/manage_subscription_cubit.dart';
import 'package:gym_management/features/subscription/models/subscription_model.dart';
import 'package:gym_management/widgets/manage_entity_form.dart';
import 'package:gym_management/widgets/state_handler.dart';

class SubscriptionForm extends StatefulWidget {
  final SubscriptionModel? subscription;
  final bool viewMode;
  const SubscriptionForm({
    super.key,
    required this.subscription,
    this.viewMode = false
  });

  @override
  State<SubscriptionForm> createState() => _SubscriptionFormState();
}

class _SubscriptionFormState extends State<SubscriptionForm> {
  late TextEditingController _idController;
  late TextEditingController _nameController;
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _idController = TextEditingController(
      text: widget.subscription?.id ?? '-1',
    );
    _nameController = TextEditingController(
      text: widget.subscription?.name,
    );
    _priceController = TextEditingController(
      text: widget.subscription?.price.toString() ?? '0.0',
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
    return StateHandler<ManageSubscriptionCubit>(
      child: ManageEntityForm(
        viewMode: widget.viewMode,
        fields: [
          TextField(
            controller: _idController,
            decoration: const InputDecoration(labelText: 'ID'),
          ),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: _priceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Price'),
          ),
        ],
        onSave: _onSave,
      ),
    );
  }
}
