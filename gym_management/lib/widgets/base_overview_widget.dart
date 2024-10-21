import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_management/constants/core/shared_keys.dart';
import 'package:gym_management/constants/core/state.dart';
import 'package:gym_management/constants/ui/style_contstants.dart';
import 'package:gym_management/utils/manage_entity_utils.dart';
import 'package:gym_management/widgets/state_handler.dart';

abstract class BaseCubit extends Cubit<BaseState> {
  BaseCubit(super.initialState);

  void onInit();
  void onDispose() {
    emit(const EmptyState());
  }
}

abstract class BaseOverviewWidget<T extends BaseCubit> extends StatefulWidget {
  const BaseOverviewWidget({
    super.key,
    this.showAddButton = true,
  });

  final bool showAddButton;
  Widget content(BuildContext context);
  Widget? onAdd(BuildContext context) => null;

  @override
  State<BaseOverviewWidget<T>> createState() => _BaseOverviewWidgetState<T>();
}

class _BaseOverviewWidgetState<T extends BaseCubit>
    extends State<BaseOverviewWidget<T>> {
  late final Widget? onAddWidget;
  late final ScrollController _scrollController;

  @override
  void initState() {
    onAddWidget = widget.onAdd(context);

    assert(
      !(widget.showAddButton && onAddWidget == null),
      'showAddButton is true, but onAdd returns null',
    );
    _scrollController = ScrollController();
    context.read<T>().onInit();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(StyleConstants.defaultPadding),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ),
          Expanded(
            child: Scrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: StateHandler<T>(
                    child: widget.content(context),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void toggleMenu() {
    if (!SharedKeys.scaffoldKey.currentState!.isDrawerOpen) {
      SharedKeys.scaffoldKey.currentState!.openDrawer();
    }
  }
}
