import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_management/core/cubit_provider.dart';
import 'package:gym_management/features/subscription/business_service/manage_subscription_cubit.dart';

abstract class BaseManageEntity extends StatelessWidget {
  final String title;
  Widget content(BuildContext context);

  const BaseManageEntity({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ...CubitProvider.cubits(),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: content(
            context,
          ),
        ),
      ),
    );
  }
}
