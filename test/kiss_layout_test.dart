import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kiss_layout/kiss_layout.dart';

void main() {
  test(
    'adds one to input values',
    () {
      final layout = Layout(
        child: Builder(
          builder: (context) {
            expect(context, isNotNull);
            final layout = Layout.of(context);
            expect(layout, isNotNull);
            expect(layout.heroSizes.small.width, 64);
            return Container();
          },
        ),
      );
      expect(layout.child, isNotNull);
    },
  );
}
