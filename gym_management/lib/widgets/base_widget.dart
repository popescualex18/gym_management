import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_management/constants/core/shared_keys.dart';
import 'package:gym_management/constants/core/state.dart';
import 'package:gym_management/utils/responsive.dart';
import 'package:gym_management/widgets/state_handler.dart';

abstract class BaseCubit extends Cubit<BaseState> {
  BaseCubit(super.initialState);

  void onInit();
  void onDispose();
}

abstract class BaseWidget<T extends BaseCubit> extends StatefulWidget {
  const BaseWidget({
    super.key,
  });
  Widget content(BuildContext context);
  @override
  State<BaseWidget<T>> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends BaseCubit>
    extends State<BaseWidget<T>> {

  @override
  void initState() {
    context.read<T>().onInit();
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StateHandler<T>(
      child: Responsive(
        mobile: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.menu,
              ),
              onPressed: toggleMenu,
            ),
            widget.content(context),
          ],
        ),
        desktop: widget.content(context),
      ),
    );
  }

  void toggleMenu() {
    if (!SharedKeys.scaffoldKey.currentState!.isDrawerOpen) {
      SharedKeys.scaffoldKey.currentState!.openDrawer();
    }
  }
}
