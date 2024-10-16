import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gym_management/constants/core/state.dart';
import 'package:gym_management/constants/ui/style_contstants.dart';
import 'package:gym_management/widgets/busy_indicator_widget.dart';
import 'package:gym_management/widgets/error_widget.dart';
import 'package:gym_management/widgets/snack_bar_widget.dart';

class StateHandler<T extends Cubit> extends StatefulWidget {
  const StateHandler({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<StateHandler<T>> createState() => _StateHandlerState<T>();
}

class _StateHandlerState<T extends Cubit> extends State<StateHandler<T>> {
  late final T cubit;
  late final StreamSubscription subscription;
  @override
  void initState() {
    super.initState();
    cubit = context.read<T>();
    subscription = cubit.stream.listen((_) {
      handleChanges();
    });
  }

  void handleChanges() {
    final state = cubit.state;
    if (state is ErrorState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarWidget.build(
          message: 'Your action was successful!',
          type: SnackBarType.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select<T, BaseState>((selector) => selector.state);
    if (state is BusyState) {
      return const BusyIndicatorWidget();
    }
    var isActionState = state is ActionState;
    return Stack(
      children: [
        IgnorePointer(
          ignoring: isActionState,
          child: widget.child,
        ),
        Visibility(
          visible: isActionState,
          child: const Positioned.fill(
            child: BusyIndicatorWidget(),
          ),
        ),
      ],
    );
  }
}
