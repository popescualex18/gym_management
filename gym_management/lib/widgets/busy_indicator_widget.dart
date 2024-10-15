import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gym_management/constants/ui/style_contstants.dart';

class BusyIndicatorWidget extends StatelessWidget {
  const BusyIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven
                ? StyleConstants.primaryColor
                : StyleConstants.secondaryColor,
          ),
        );
      },
    );
  }
}
