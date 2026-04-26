import 'package:flutter/material.dart';
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

  group('ResponsiveLayout', () {
    Widget buildTestApp({required double width, required Widget child}) {
      return MediaQuery(
        data: MediaQueryData(size: Size(width, 800)),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: child,
        ),
      );
    }

    testWidgets('selects small layout when width is below medium breakpoint',
        (tester) async {
      LayoutData? captured;
      await tester.pumpWidget(
        buildTestApp(
          width: 400,
          child: ResponsiveLayout(
            breakpoints: const LayoutScreenBreakpoints(medium: 600, large: 960),
            small: LayoutData.compact,
            medium: LayoutData.standard,
            large: LayoutData.spacious,
            child: Builder(
              builder: (context) {
                captured = Layout.of(context).data;
                return const SizedBox();
              },
            ),
          ),
        ),
      );
      expect(captured, equals(LayoutData.compact));
    });

    testWidgets('selects medium layout when width is between breakpoints',
        (tester) async {
      LayoutData? captured;
      await tester.pumpWidget(
        buildTestApp(
          width: 700,
          child: ResponsiveLayout(
            breakpoints: const LayoutScreenBreakpoints(medium: 600, large: 960),
            small: LayoutData.compact,
            medium: LayoutData.standard,
            large: LayoutData.spacious,
            child: Builder(
              builder: (context) {
                captured = Layout.of(context).data;
                return const SizedBox();
              },
            ),
          ),
        ),
      );
      expect(captured, equals(LayoutData.standard));
    });

    testWidgets('selects large layout when width is at or above large breakpoint',
        (tester) async {
      LayoutData? captured;
      await tester.pumpWidget(
        buildTestApp(
          width: 1200,
          child: ResponsiveLayout(
            breakpoints: const LayoutScreenBreakpoints(medium: 600, large: 960),
            small: LayoutData.compact,
            medium: LayoutData.standard,
            large: LayoutData.spacious,
            child: Builder(
              builder: (context) {
                captured = Layout.of(context).data;
                return const SizedBox();
              },
            ),
          ),
        ),
      );
      expect(captured, equals(LayoutData.spacious));
    });

    testWidgets('uses default breakpoints when none provided', (tester) async {
      LayoutData? captured;
      await tester.pumpWidget(
        buildTestApp(
          width: 400,
          child: ResponsiveLayout(
            small: LayoutData.compact,
            medium: LayoutData.standard,
            large: LayoutData.spacious,
            child: Builder(
              builder: (context) {
                captured = Layout.of(context).data;
                return const SizedBox();
              },
            ),
          ),
        ),
      );
      expect(captured, equals(LayoutData.compact));
    });
  });
}
