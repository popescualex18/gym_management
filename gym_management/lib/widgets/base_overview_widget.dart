import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_management/constants/core/shared_keys.dart';
import 'package:gym_management/constants/core/state.dart';
import 'package:gym_management/constants/ui/style_contstants.dart';
import 'package:gym_management/utils/responsive.dart';
import 'package:gym_management/widgets/state_handler.dart';

abstract class BaseCubit extends Cubit<BaseState> {
  BaseCubit(super.initialState);

  void onInit();
  void onDispose();
}

abstract class BaseOverviewWidget<T extends BaseCubit> extends StatefulWidget {
  const BaseOverviewWidget({
    super.key,
  });
  Widget content(BuildContext context);
  @override
  State<BaseOverviewWidget<T>> createState() => _BaseOverviewWidgetState<T>();
}

class _BaseOverviewWidgetState<T extends BaseCubit>
    extends State<BaseOverviewWidget<T>> {
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
    return Padding(
      padding: const EdgeInsets.all(
        StyleConstants.defaultPadding,
      ),
      child: StateHandler<T>(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ),
            widget.content(context),
          ],
        ),
      ),
    );
  }

  void toggleMenu() {
    if (!SharedKeys.scaffoldKey.currentState!.isDrawerOpen) {
      SharedKeys.scaffoldKey.currentState!.openDrawer();
    }
  }
}
