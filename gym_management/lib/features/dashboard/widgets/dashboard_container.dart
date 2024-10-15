import 'package:flutter/material.dart';

class DashboardContainer extends StatefulWidget {
  const DashboardContainer({
    super.key,
    required this.onInit,
  });
  final Function(BuildContext context) onInit;
  @override
  State<DashboardContainer> createState() => _DashboardContainerState();
}

class _DashboardContainerState extends State<DashboardContainer> {
  @override
  void initState() {
    widget.onInit(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
