import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kiss_layout/kiss_layout.dart';

void main() {
  testWidgets('Layout exposes its data via of(context)', (tester) async {
    LayoutData? captured;
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Layout(
          child: Builder(
            builder: (context) {
              captured = Layout.of(context);
              return const SizedBox();
            },
          ),
        ),
      ),
    );
    expect(captured, isNotNull);
    expect(captured!.heroSizes.small.width, 64);
  });

  group('Layout with breakpoints', () {
    Widget buildTestApp({required double width, required Widget child}) {
      return MediaQuery(
        data: MediaQueryData(size: Size(width, 800)),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: child,
        ),
      );
    }

    testWidgets('uses base data when width is below all breakpoints',
        (tester) async {
      LayoutData? captured;
      await tester.pumpWidget(
        buildTestApp(
          width: 400,
          child: Layout(
            data: LayoutData.compact,
            breakpoints: const [
              LayoutBreakpoint(minWidth: 600, data: LayoutData.standard),
              LayoutBreakpoint(minWidth: 960, data: LayoutData.spacious),
            ],
            child: Builder(
              builder: (context) {
                captured = Layout.of(context);
                return const SizedBox();
              },
            ),
          ),
        ),
      );
      expect(captured, equals(LayoutData.compact));
    });

    testWidgets('selects middle breakpoint when width is between',
        (tester) async {
      LayoutData? captured;
      await tester.pumpWidget(
        buildTestApp(
          width: 700,
          child: Layout(
            data: LayoutData.compact,
            breakpoints: const [
              LayoutBreakpoint(minWidth: 600, data: LayoutData.standard),
              LayoutBreakpoint(minWidth: 960, data: LayoutData.spacious),
            ],
            child: Builder(
              builder: (context) {
                captured = Layout.of(context);
                return const SizedBox();
              },
            ),
          ),
        ),
      );
      expect(captured, equals(LayoutData.standard));
    });

    testWidgets(
        'selects last breakpoint when width is at or above its minWidth',
        (tester) async {
      LayoutData? captured;
      await tester.pumpWidget(
        buildTestApp(
          width: 1200,
          child: Layout(
            data: LayoutData.compact,
            breakpoints: const [
              LayoutBreakpoint(minWidth: 600, data: LayoutData.standard),
              LayoutBreakpoint(minWidth: 960, data: LayoutData.spacious),
            ],
            child: Builder(
              builder: (context) {
                captured = Layout.of(context);
                return const SizedBox();
              },
            ),
          ),
        ),
      );
      expect(captured, equals(LayoutData.spacious));
    });

    testWidgets('single breakpoint switches at its minWidth',
        (tester) async {
      LayoutData? captured;
      await tester.pumpWidget(
        buildTestApp(
          width: 600,
          child: Layout(
            data: LayoutData.compact,
            breakpoints: const [
              LayoutBreakpoint(minWidth: 600, data: LayoutData.standard),
            ],
            child: Builder(
              builder: (context) {
                captured = Layout.of(context);
                return const SizedBox();
              },
            ),
          ),
        ),
      );
      expect(captured, equals(LayoutData.standard));
    });

    testWidgets('selects upper breakpoint exactly at its minWidth',
        (tester) async {
      LayoutData? captured;
      await tester.pumpWidget(
        buildTestApp(
          width: 960,
          child: Layout(
            data: LayoutData.compact,
            breakpoints: const [
              LayoutBreakpoint(minWidth: 600, data: LayoutData.standard),
              LayoutBreakpoint(minWidth: 960, data: LayoutData.spacious),
            ],
            child: Builder(
              builder: (context) {
                captured = Layout.of(context);
                return const SizedBox();
              },
            ),
          ),
        ),
      );
      expect(captured, equals(LayoutData.spacious));
    });

    testWidgets('consumers do not rebuild on resize within same breakpoint',
        (tester) async {
      var buildCount = 0;
      final consumer = Builder(
        builder: (context) {
          Layout.of(context);
          buildCount++;
          return const SizedBox();
        },
      );

      Widget app(double width) => buildTestApp(
            width: width,
            child: Layout(
              data: LayoutData.compact,
              breakpoints: const [
                LayoutBreakpoint(minWidth: 600, data: LayoutData.standard),
              ],
              child: consumer,
            ),
          );

      await tester.pumpWidget(app(400));
      expect(buildCount, 1);

      await tester.pumpWidget(app(500));
      expect(buildCount, 1, reason: 'still below 600 — no resolved change');

      await tester.pumpWidget(app(700));
      expect(buildCount, 2, reason: 'crossed breakpoint — should rebuild');

      await tester.pumpWidget(app(900));
      expect(buildCount, 2, reason: 'still above 600 — no resolved change');
    });
  });
}
