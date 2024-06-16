import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/miscellaneous/values.dart';
import 'package:cotwcastmate/widgets/app/padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WidgetLoadingIndicator extends StatelessWidget {
  const WidgetLoadingIndicator({
    super.key,
  });

  Widget _buildWidgets() {
    return SizedBox(
      height: Values.tapSize + 60,
      child: WidgetPadding.h30(
        child: SpinKitFadingCircle(
          size: Values.tapSize,
          itemBuilder: (context, i) {
            return Container(
              margin: const EdgeInsets.only(left: 1.5, right: 1.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Interface.primary,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
