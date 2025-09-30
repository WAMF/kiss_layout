import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

enum LayoutSizes {
  large,
  medium,
  small,
}

abstract class TShirtSizes<T> {
  T get large;
  T get medium;
  T get small;
}

class LayoutItemGaps implements TShirtSizes<double> {
  const LayoutItemGaps({
    this.large = 20.0,
    this.medium = 8.0,
    this.small = 4.0,
  });

  factory LayoutItemGaps.fromLayoutEdgeSpacing(LayoutEdgeSpacing edgeSpacing) {
    return LayoutItemGaps(
      large: edgeSpacing.inner.large.vertical,
      medium: edgeSpacing.inner.medium.vertical,
      small: edgeSpacing.inner.small.vertical,
    );
  }
  @override
  final double large;
  @override
  final double medium;
  @override
  final double small;
}

class LayoutEdgeSpacingSizes implements TShirtSizes<EdgeInsets> {
  const LayoutEdgeSpacingSizes({
    this.large = const EdgeInsets.all(20),
    this.medium = const EdgeInsets.all(12),
    this.small = const EdgeInsets.all(8),
  });
  @override
  final EdgeInsets large;
  @override
  final EdgeInsets medium;
  @override
  final EdgeInsets small;
}

class LayoutEdgeSpacing {
  const LayoutEdgeSpacing({
    this.outer = const LayoutEdgeSpacingSizes(),
    this.inner = const LayoutEdgeSpacingSizes(),
    this.proportionate = const LayoutEdgeSpacingSizes(
      large: EdgeInsets.all(0.05),
      medium: EdgeInsets.all(0.03),
      small: EdgeInsets.all(0.01),
    ),
  });

  factory LayoutEdgeSpacing.fromItemGaps(LayoutItemGaps itemGaps) {
    return LayoutEdgeSpacing(
      inner: LayoutEdgeSpacingSizes(
        large: EdgeInsets.all(itemGaps.large),
        medium: EdgeInsets.all(itemGaps.medium),
        small: EdgeInsets.all(itemGaps.small),
      ),
      outer: LayoutEdgeSpacingSizes(
        large: EdgeInsets.all(itemGaps.large),
        medium: EdgeInsets.all(itemGaps.medium),
        small: EdgeInsets.all(itemGaps.small),
      ),
    );
  }
  final LayoutEdgeSpacingSizes outer;
  final LayoutEdgeSpacingSizes inner;
  final LayoutEdgeSpacingSizes proportionate;
  EdgeInsets proportionateConvert(EdgeInsets proportionate, Size size) {
    return EdgeInsets.fromLTRB(
      size.width * proportionate.left,
      size.height * proportionate.top,
      size.width * proportionate.right,
      size.height * proportionate.bottom,
    );
  }
}

class LayoutIconSizes {
  const LayoutIconSizes({
    this.large = const Size(24, 24),
    this.medium = const Size(16, 16),
    this.small = const Size(12, 12),
  });
  final Size large;
  final Size medium;
  final Size small;
}

class LayoutActionSizes {
  const LayoutActionSizes({
    this.large = const Size(200, 44),
    this.medium = const Size(100, 44),
    this.small = const Size(44, 44),
  });
  final Size large;
  final Size medium;
  final Size small;
}

class LayoutCornerRadii implements TShirtSizes<double> {
  const LayoutCornerRadii({
    this.large = 16.0,
    this.medium = 8.0,
    this.small = 4.0,
  });
  @override
  final double large;
  @override
  final double medium;
  @override
  final double small;
}

class LayoutHeroSizes {
  const LayoutHeroSizes({
    this.large = const Size(256, 256),
    this.medium = const Size(158, 158),
    this.small = const Size(64, 64),
    this.largeProportionate = const Size(0.4, 0.4),
    this.mediumProportionate = const Size(0.3, 0.3),
    this.smallProportionate = const Size(0.1, 0.1),
  });
  final Size large;
  final Size medium;
  final Size small;
  final Size largeProportionate;
  final Size mediumProportionate;
  final Size smallProportionate;
}

class LayoutScreenSizes {
  const LayoutScreenSizes({
    this.minLanscapeTableWidth = 800,
  });
  final double minLanscapeTableWidth;
}

class LayoutData {
  const LayoutData({
    this.itemSpacing = const LayoutItemGaps(),
    this.edgeSpacing = const LayoutEdgeSpacing(),
    this.actionSizes = const LayoutActionSizes(),
    this.cornerRadii = const LayoutCornerRadii(),
    this.heroSizes = const LayoutHeroSizes(),
    this.iconSizes = const LayoutIconSizes(),
    this.modalBottomSheetHeightPercentage = 0.8,
    this.screenSizes = const LayoutScreenSizes(),
  });

  final LayoutItemGaps itemSpacing;
  final LayoutEdgeSpacing edgeSpacing;
  final LayoutCornerRadii cornerRadii;
  final LayoutHeroSizes heroSizes;
  final double modalBottomSheetHeightPercentage;
  final LayoutScreenSizes screenSizes;
  final LayoutIconSizes iconSizes;
  final LayoutActionSizes actionSizes;

  static const LayoutData standard = LayoutData();

  static const LayoutData compact = LayoutData(
    itemSpacing: LayoutItemGaps(
      large: 16,
    ),
    edgeSpacing: LayoutEdgeSpacing(
      outer: LayoutEdgeSpacingSizes(
        large: EdgeInsets.all(16),
      ),
      inner: LayoutEdgeSpacingSizes(
        large: EdgeInsets.all(12),
        medium: EdgeInsets.all(8),
        small: EdgeInsets.all(4),
      ),
    ),
    cornerRadii: LayoutCornerRadii(
      large: 12,
    ),
    actionSizes: LayoutActionSizes(
      large: Size(180, 40),
      medium: Size(90, 40),
      small: Size(40, 40),
    ),
    heroSizes: LayoutHeroSizes(
      large: Size(200, 200),
      medium: Size(120, 120),
      small: Size(48, 48),
    ),
  );

  static const LayoutData spacious = LayoutData(
    itemSpacing: LayoutItemGaps(
      large: 32,
      medium: 24,
      small: 16,
    ),
    edgeSpacing: LayoutEdgeSpacing(
      outer: LayoutEdgeSpacingSizes(
        large: EdgeInsets.all(32),
        medium: EdgeInsets.all(24),
        small: EdgeInsets.all(16),
      ),
      inner: LayoutEdgeSpacingSizes(
        large: EdgeInsets.all(24),
        medium: EdgeInsets.all(16),
      ),
    ),
    cornerRadii: LayoutCornerRadii(
      large: 24,
      medium: 16,
      small: 8,
    ),
    actionSizes: LayoutActionSizes(
      large: Size(240, 48),
      medium: Size(120, 48),
      small: Size(48, 48),
    ),
    heroSizes: LayoutHeroSizes(
      large: Size(320, 320),
      medium: Size(200, 200),
      small: Size(80, 80),
    ),
  );
}

class Layout extends InheritedWidget {
  const Layout({
    required super.child,
    this.data = LayoutData.standard,
    super.key,
  });

  const Layout.custom({
    required super.child,
    required this.data,
    super.key,
  });

  final LayoutData data;

  // Convenience getters for backward compatibility
  LayoutItemGaps get itemSpacing => data.itemSpacing;
  LayoutEdgeSpacing get edgeSpacing => data.edgeSpacing;
  LayoutCornerRadii get cornerRadii => data.cornerRadii;
  LayoutHeroSizes get heroSizes => data.heroSizes;
  double get modalBottomSheetHeightPercentage =>
      data.modalBottomSheetHeightPercentage;
  LayoutScreenSizes get screenSizes => data.screenSizes;
  LayoutIconSizes get iconSizes => data.iconSizes;
  LayoutActionSizes get actionSizes => data.actionSizes;

  static Layout? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Layout>();
  }

  static Layout of(BuildContext context) {
    final result = maybeOf(context);
    assert(result != null, 'No Layout found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(Layout oldWidget) => data != oldWidget.data;

  List<Widget> insertSpaceBetween({
    required List<Widget> items,
    LayoutSizes size = LayoutSizes.medium,
  }) {
    final result = <Widget>[];
    for (var i = 0; i < items.length; i++) {
      result.add(items[i]);
      if (i < items.length - 1) {
        switch (size) {
          case LayoutSizes.large:
            result.add(const GapLarge());
          case LayoutSizes.small:
            result.add(const GapSmall());
          case LayoutSizes.medium:
            result.add(const GapMedium());
        }
      }
    }
    return result;
  }
}

class GapSmall extends StatelessWidget {
  const GapSmall({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = Layout.of(context);
    return Gap(layout.itemSpacing.small);
  }
}

class GapMedium extends StatelessWidget {
  const GapMedium({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = Layout.of(context);
    return Gap(layout.itemSpacing.medium);
  }
}

class GapLarge extends StatelessWidget {
  const GapLarge({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = Layout.of(context);
    return Gap(layout.itemSpacing.large);
  }
}

class IconSmall extends StatelessWidget {
  const IconSmall(
    this.icon, {
    super.key,
    this.color,
    this.semanticLabel,
    this.textDirection,
  });

  final IconData icon;
  final Color? color;
  final String? semanticLabel;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    final layout = Layout.of(context);
    return Icon(
      icon,
      size: layout.iconSizes.small.width,
      color: color,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
    );
  }
}

class IconMedium extends StatelessWidget {
  const IconMedium(
    this.icon, {
    super.key,
    this.color,
    this.semanticLabel,
    this.textDirection,
  });

  final IconData icon;
  final Color? color;
  final String? semanticLabel;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    final layout = Layout.of(context);
    return Icon(
      icon,
      size: layout.iconSizes.medium.width,
      color: color,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
    );
  }
}

class IconLarge extends StatelessWidget {
  const IconLarge(
    this.icon, {
    super.key,
    this.color,
    this.semanticLabel,
    this.textDirection,
  });

  final IconData icon;
  final Color? color;
  final String? semanticLabel;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    final layout = Layout.of(context);
    return Icon(
      icon,
      size: layout.iconSizes.large.width,
      color: color,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
    );
  }
}

// Base padding widget
abstract class _BasePadding extends StatelessWidget {
  const _BasePadding({
    required this.child,
    this.modifier,
    super.key,
  });

  final Widget child;
  final EdgeInsets Function(EdgeInsets)? modifier;

  EdgeInsets getPadding(Layout layout);

  @override
  Widget build(BuildContext context) {
    final layout = Layout.of(context);
    final padding = getPadding(layout);
    return Padding(
      padding: modifier != null ? modifier!(padding) : padding,
      child: child,
    );
  }
}

class PaddingInnerSmall extends _BasePadding {
  const PaddingInnerSmall({required super.child, super.key, super.modifier});

  factory PaddingInnerSmall.onlyVertical({required Widget child, Key? key}) =>
      PaddingInnerSmall(
        key: key,
        modifier: (padding) => padding.onlyVertical,
        child: child,
      );

  factory PaddingInnerSmall.onlyHorizontal({required Widget child, Key? key}) =>
      PaddingInnerSmall(
        key: key,
        modifier: (padding) => padding.onlyHorizontal,
        child: child,
      );

  factory PaddingInnerSmall.onlyBottom({required Widget child, Key? key}) =>
      PaddingInnerSmall(
        key: key,
        modifier: (padding) => padding.onlyBottom,
        child: child,
      );

  factory PaddingInnerSmall.onlyTop({required Widget child, Key? key}) =>
      PaddingInnerSmall(
        key: key,
        modifier: (padding) => padding.onlyTop,
        child: child,
      );

  factory PaddingInnerSmall.onlyLeft({required Widget child, Key? key}) =>
      PaddingInnerSmall(
        key: key,
        modifier: (padding) => padding.onlyLeft,
        child: child,
      );

  factory PaddingInnerSmall.onlyRight({required Widget child, Key? key}) =>
      PaddingInnerSmall(
        key: key,
        modifier: (padding) => padding.onlyRight,
        child: child,
      );

  factory PaddingInnerSmall.onlyHorizontalAndBottom({
    required Widget child,
    Key? key,
  }) =>
      PaddingInnerSmall(
        key: key,
        modifier: (padding) => padding.onlyHorizontalAndBottom,
        child: child,
      );

  factory PaddingInnerSmall.onlyHorizontalAndTop({
    required Widget child,
    Key? key,
  }) =>
      PaddingInnerSmall(
        key: key,
        modifier: (padding) => padding.onlyHorizontalAndTop,
        child: child,
      );

  @override
  EdgeInsets getPadding(Layout layout) => layout.edgeSpacing.inner.small;
}

class PaddingInnerMedium extends _BasePadding {
  const PaddingInnerMedium({required super.child, super.key, super.modifier});

  factory PaddingInnerMedium.onlyVertical({required Widget child, Key? key}) =>
      PaddingInnerMedium(
        key: key,
        modifier: (padding) => padding.onlyVertical,
        child: child,
      );

  factory PaddingInnerMedium.onlyHorizontal({
    required Widget child,
    Key? key,
  }) =>
      PaddingInnerMedium(
        key: key,
        modifier: (padding) => padding.onlyHorizontal,
        child: child,
      );

  factory PaddingInnerMedium.onlyBottom({required Widget child, Key? key}) =>
      PaddingInnerMedium(
        key: key,
        modifier: (padding) => padding.onlyBottom,
        child: child,
      );

  factory PaddingInnerMedium.onlyTop({required Widget child, Key? key}) =>
      PaddingInnerMedium(
        key: key,
        modifier: (padding) => padding.onlyTop,
        child: child,
      );

  factory PaddingInnerMedium.onlyLeft({required Widget child, Key? key}) =>
      PaddingInnerMedium(
        key: key,
        modifier: (padding) => padding.onlyLeft,
        child: child,
      );

  factory PaddingInnerMedium.onlyRight({required Widget child, Key? key}) =>
      PaddingInnerMedium(
        key: key,
        modifier: (padding) => padding.onlyRight,
        child: child,
      );

  factory PaddingInnerMedium.onlyHorizontalAndBottom({
    required Widget child,
    Key? key,
  }) =>
      PaddingInnerMedium(
        key: key,
        modifier: (padding) => padding.onlyHorizontalAndBottom,
        child: child,
      );

  factory PaddingInnerMedium.onlyHorizontalAndTop({
    required Widget child,
    Key? key,
  }) =>
      PaddingInnerMedium(
        key: key,
        modifier: (padding) => padding.onlyHorizontalAndTop,
        child: child,
      );

  @override
  EdgeInsets getPadding(Layout layout) => layout.edgeSpacing.inner.medium;
}

class PaddingInnerLarge extends _BasePadding {
  const PaddingInnerLarge({required super.child, super.key, super.modifier});

  factory PaddingInnerLarge.onlyVertical({required Widget child, Key? key}) =>
      PaddingInnerLarge(
        key: key,
        modifier: (padding) => padding.onlyVertical,
        child: child,
      );

  factory PaddingInnerLarge.onlyHorizontal({required Widget child, Key? key}) =>
      PaddingInnerLarge(
        key: key,
        modifier: (padding) => padding.onlyHorizontal,
        child: child,
      );

  factory PaddingInnerLarge.onlyBottom({required Widget child, Key? key}) =>
      PaddingInnerLarge(
        key: key,
        modifier: (padding) => padding.onlyBottom,
        child: child,
      );

  factory PaddingInnerLarge.onlyTop({required Widget child, Key? key}) =>
      PaddingInnerLarge(
        key: key,
        modifier: (padding) => padding.onlyTop,
        child: child,
      );

  factory PaddingInnerLarge.onlyLeft({required Widget child, Key? key}) =>
      PaddingInnerLarge(
        key: key,
        modifier: (padding) => padding.onlyLeft,
        child: child,
      );

  factory PaddingInnerLarge.onlyRight({required Widget child, Key? key}) =>
      PaddingInnerLarge(
        key: key,
        modifier: (padding) => padding.onlyRight,
        child: child,
      );

  factory PaddingInnerLarge.onlyHorizontalAndBottom({
    required Widget child,
    Key? key,
  }) =>
      PaddingInnerLarge(
        key: key,
        modifier: (padding) => padding.onlyHorizontalAndBottom,
        child: child,
      );

  factory PaddingInnerLarge.onlyHorizontalAndTop({
    required Widget child,
    Key? key,
  }) =>
      PaddingInnerLarge(
        key: key,
        modifier: (padding) => padding.onlyHorizontalAndTop,
        child: child,
      );

  @override
  EdgeInsets getPadding(Layout layout) => layout.edgeSpacing.inner.large;
}

class PaddingOuterSmall extends _BasePadding {
  const PaddingOuterSmall({required super.child, super.key, super.modifier});

  factory PaddingOuterSmall.onlyVertical({required Widget child, Key? key}) =>
      PaddingOuterSmall(
        key: key,
        modifier: (padding) => padding.onlyVertical,
        child: child,
      );

  factory PaddingOuterSmall.onlyHorizontal({required Widget child, Key? key}) =>
      PaddingOuterSmall(
        key: key,
        modifier: (padding) => padding.onlyHorizontal,
        child: child,
      );

  factory PaddingOuterSmall.onlyBottom({required Widget child, Key? key}) =>
      PaddingOuterSmall(
        key: key,
        modifier: (padding) => padding.onlyBottom,
        child: child,
      );

  factory PaddingOuterSmall.onlyTop({required Widget child, Key? key}) =>
      PaddingOuterSmall(
        key: key,
        modifier: (padding) => padding.onlyTop,
        child: child,
      );

  factory PaddingOuterSmall.onlyLeft({required Widget child, Key? key}) =>
      PaddingOuterSmall(
        key: key,
        modifier: (padding) => padding.onlyLeft,
        child: child,
      );

  factory PaddingOuterSmall.onlyRight({required Widget child, Key? key}) =>
      PaddingOuterSmall(
        key: key,
        modifier: (padding) => padding.onlyRight,
        child: child,
      );

  factory PaddingOuterSmall.onlyHorizontalAndBottom({
    required Widget child,
    Key? key,
  }) =>
      PaddingOuterSmall(
        key: key,
        modifier: (padding) => padding.onlyHorizontalAndBottom,
        child: child,
      );

  factory PaddingOuterSmall.onlyHorizontalAndTop({
    required Widget child,
    Key? key,
  }) =>
      PaddingOuterSmall(
        key: key,
        modifier: (padding) => padding.onlyHorizontalAndTop,
        child: child,
      );

  @override
  EdgeInsets getPadding(Layout layout) => layout.edgeSpacing.outer.small;
}

class PaddingOuterMedium extends _BasePadding {
  const PaddingOuterMedium({required super.child, super.key, super.modifier});

  factory PaddingOuterMedium.onlyVertical({required Widget child, Key? key}) =>
      PaddingOuterMedium(
        key: key,
        modifier: (padding) => padding.onlyVertical,
        child: child,
      );

  factory PaddingOuterMedium.onlyHorizontal({
    required Widget child,
    Key? key,
  }) =>
      PaddingOuterMedium(
        key: key,
        modifier: (padding) => padding.onlyHorizontal,
        child: child,
      );

  factory PaddingOuterMedium.onlyBottom({required Widget child, Key? key}) =>
      PaddingOuterMedium(
        key: key,
        modifier: (padding) => padding.onlyBottom,
        child: child,
      );

  factory PaddingOuterMedium.onlyTop({required Widget child, Key? key}) =>
      PaddingOuterMedium(
        key: key,
        modifier: (padding) => padding.onlyTop,
        child: child,
      );

  factory PaddingOuterMedium.onlyLeft({required Widget child, Key? key}) =>
      PaddingOuterMedium(
        key: key,
        modifier: (padding) => padding.onlyLeft,
        child: child,
      );

  factory PaddingOuterMedium.onlyRight({required Widget child, Key? key}) =>
      PaddingOuterMedium(
        key: key,
        modifier: (padding) => padding.onlyRight,
        child: child,
      );

  factory PaddingOuterMedium.onlyHorizontalAndBottom({
    required Widget child,
    Key? key,
  }) =>
      PaddingOuterMedium(
        key: key,
        modifier: (padding) => padding.onlyHorizontalAndBottom,
        child: child,
      );

  factory PaddingOuterMedium.onlyHorizontalAndTop({
    required Widget child,
    Key? key,
  }) =>
      PaddingOuterMedium(
        key: key,
        modifier: (padding) => padding.onlyHorizontalAndTop,
        child: child,
      );

  @override
  EdgeInsets getPadding(Layout layout) => layout.edgeSpacing.outer.medium;
}

class PaddingOuterLarge extends _BasePadding {
  const PaddingOuterLarge({required super.child, super.key, super.modifier});

  factory PaddingOuterLarge.onlyVertical({required Widget child, Key? key}) =>
      PaddingOuterLarge(
        key: key,
        modifier: (padding) => padding.onlyVertical,
        child: child,
      );

  factory PaddingOuterLarge.onlyHorizontal({required Widget child, Key? key}) =>
      PaddingOuterLarge(
        key: key,
        modifier: (padding) => padding.onlyHorizontal,
        child: child,
      );

  factory PaddingOuterLarge.onlyBottom({required Widget child, Key? key}) =>
      PaddingOuterLarge(
        key: key,
        modifier: (padding) => padding.onlyBottom,
        child: child,
      );

  factory PaddingOuterLarge.onlyTop({required Widget child, Key? key}) =>
      PaddingOuterLarge(
        key: key,
        modifier: (padding) => padding.onlyTop,
        child: child,
      );

  factory PaddingOuterLarge.onlyLeft({required Widget child, Key? key}) =>
      PaddingOuterLarge(
        key: key,
        modifier: (padding) => padding.onlyLeft,
        child: child,
      );

  factory PaddingOuterLarge.onlyRight({required Widget child, Key? key}) =>
      PaddingOuterLarge(
        key: key,
        modifier: (padding) => padding.onlyRight,
        child: child,
      );

  factory PaddingOuterLarge.onlyHorizontalAndBottom({
    required Widget child,
    Key? key,
  }) =>
      PaddingOuterLarge(
        key: key,
        modifier: (padding) => padding.onlyHorizontalAndBottom,
        child: child,
      );

  factory PaddingOuterLarge.onlyHorizontalAndTop({
    required Widget child,
    Key? key,
  }) =>
      PaddingOuterLarge(
        key: key,
        modifier: (padding) => padding.onlyHorizontalAndTop,
        child: child,
      );

  @override
  EdgeInsets getPadding(Layout layout) => layout.edgeSpacing.outer.large;
}

extension EdgeInsetsConvienience on EdgeInsets {
  EdgeInsets get onlyVertical {
    return EdgeInsets.only(top: top, bottom: bottom);
  }

  EdgeInsets get onlyHorizontal {
    return EdgeInsets.only(left: left, right: right);
  }

  EdgeInsets get onlyBottom {
    return EdgeInsets.only(bottom: bottom);
  }

  EdgeInsets get onlyHorizontalAndBottom {
    return EdgeInsets.only(left: left, right: right, bottom: bottom);
  }

  EdgeInsets get onlyHorizontalAndTop {
    return EdgeInsets.only(left: left, right: right, top: top);
  }

  EdgeInsets get onlyTop {
    return EdgeInsets.only(top: top);
  }

  EdgeInsets get onlyLeft {
    return EdgeInsets.only(left: left);
  }

  EdgeInsets get onlyRight {
    return EdgeInsets.only(right: right);
  }
}

class CompactLayout extends Layout {
  const CompactLayout({
    required super.child,
    super.key,
  }) : super(data: LayoutData.compact);
}

class SpaciousLayout extends Layout {
  const SpaciousLayout({
    required super.child,
    super.key,
  }) : super(data: LayoutData.spacious);
}
