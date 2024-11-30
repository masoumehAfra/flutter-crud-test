import 'package:flutter/cupertino.dart';

extension WidgetExtension on num {
  SizedBox get space => SizedBox(
        height: toDouble(),
        width: toDouble(),
      );

  SizedBox get hsp => SizedBox(
        height: toDouble(),
      );

  SizedBox get wsp => SizedBox(
        width: toDouble(),
      );
}
