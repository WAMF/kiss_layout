## 3.0.0

### Breaking Changes
- **BREAKING**: `Layout` is now a `StatelessWidget` (was `InheritedWidget`). The InheritedWidget pattern is preserved internally as a private `_LayoutScope`. `Layout.of(context)` continues to be the supported entry point and now returns `LayoutData` (was `Layout`). Field-access expressions (`Layout.of(context).itemSpacing.small`, etc.) keep working unchanged because `LayoutData`'s field names mirror the previous convenience getters. Code that bound `Layout.of` to a typed variable (`final Layout layout = ...`) or wrote functions taking `Layout` parameters needs `Layout` → `LayoutData`.
- **BREAKING**: Removed `LayoutScreenBreakpoints` and the `screenSizes` field on `LayoutData`. Consumers now own their breakpoints by passing a `breakpoints: <LayoutBreakpoint>[…]` list to `Layout`.
- **BREAKING**: Removed `Layout.custom(...)` — use the regular `Layout(data: …)` constructor.
- **BREAKING**: `Layout.insertSpaceBetween` is now a `static` method (was an instance method).

### Added
- `Layout` accepts an optional `breakpoints: List<LayoutBreakpoint>` argument for responsive layout resolution. `LayoutBreakpoint(minWidth: …, data: …)` swaps in a different `LayoutData` at or above the threshold; the list must be sorted ascending by `minWidth`.
- Sorting is enforced both via `assert` (debug) and `throw FlutterError(...)` (release/profile) so mis-sorted lists are caught in every build mode.
- Internal split: public `Layout` is a `StatelessWidget` that resolves the current breakpoint from `MediaQuery.sizeOf(context).width` and emits a private `_LayoutScope` `InheritedWidget`. Consumers reading via `Layout.of(context)` only rebuild when the resolved `LayoutData` actually changes (not on every pixel of resize).

### Migration Guide

```dart
// Before
Layout(
  data: LayoutData.standard,
  child: ...,
)

// After (non-responsive — unchanged)
Layout(
  data: LayoutData.standard,
  child: ...,
)

// After (responsive — new)
Layout(
  data: LayoutData.compact,
  breakpoints: const [
    LayoutBreakpoint(minWidth: 600, data: LayoutData.standard),
    LayoutBreakpoint(minWidth: 960, data: LayoutData.spacious),
  ],
  child: ...,
)
```

If you used `LayoutData.screenSizes.mediumStartPoint` (or similar), define your own breakpoint constants at the app level and pass them to `Layout(breakpoints: …)`.

## 2.0.0

### Breaking Changes
- **BREAKING**: Renamed `LayoutScreenSizes` to `LayoutScreenBreakpoints`
- **BREAKING**: Removed `minLanscapeTableWidth` property (had typo in name)
- **BREAKING**: Changed to T-shirt size naming with two breakpoints:
  - `mediumStartPoint` (default: 600) - where medium screens start
  - `largeStartPoint` (default: 960) - where large screens start

### Added
- Opinionated breakpoint system with three screen sizes:
  - **Small**: width < 600
  - **Medium**: 600 ≤ width < 960
  - **Large**: width ≥ 960

### Migration Guide
Replace `LayoutScreenSizes` with `LayoutScreenBreakpoints`:

```dart
// Before
screenSizes: LayoutScreenSizes(minLanscapeTableWidth: 800)

// After
screenSizes: LayoutScreenBreakpoints(
  mediumStartPoint: 600,
  largeStartPoint: 960,
)
```

Access breakpoints using the new property names:
```dart
final breakpoints = Layout.of(context).screenSizes;
if (width < breakpoints.mediumStartPoint) {
  // Small screen
} else if (width < breakpoints.largeStartPoint) {
  // Medium screen
} else {
  // Large screen
}
```

## 1.3.1

### Changed
- Updated README with documentation for selective padding factory constructors

## 1.3.0

### Added
- Convenience factory constructors for all padding widgets to enable selective padding application:
  - `onlyVertical` - applies padding only to top and bottom
  - `onlyHorizontal` - applies padding only to left and right
  - `onlyBottom` - applies padding only to bottom
  - `onlyTop` - applies padding only to top
  - `onlyLeft` - applies padding only to left
  - `onlyRight` - applies padding only to right
  - `onlyHorizontalAndBottom` - applies padding to left, right, and bottom
  - `onlyHorizontalAndTop` - applies padding to left, right, and top
- Available for all padding widgets: `PaddingInnerSmall`, `PaddingInnerMedium`, `PaddingInnerLarge`, `PaddingOuterSmall`, `PaddingOuterMedium`, `PaddingOuterLarge`

## 1.2.0

- **BREAKING**: Refactored Layout widget to use a single `LayoutData` parameter instead of individual properties
  - All layout configuration is now encapsulated in the `LayoutData` class
  - Added predefined layouts: `LayoutData.standard`, `LayoutData.compact`, and `LayoutData.spacious`
  - Existing code using individual properties will need to be updated to use `LayoutData`

## 1.1.0

### Added
- `LayoutIconSizes` for standardized icon dimensions (24×24, 16×16, 12×12)
- Pre-built icon widgets: `IconLarge`, `IconMedium`, and `IconSmall` for easy access to consistent icon sizes

### Changed

- Fixed all linter warnings by disabling `public_member_api_docs` rule
- Applied dart fix to remove redundant argument values
- Converted unnecessary double literals to integers
- Sorted dependencies alphabetically in pubspec.yaml

## 1.0.0

All notable changes to the Kiss Layout package will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### Added
- Initial release of Kiss Layout package
- Core Layout widget with InheritedWidget implementation
- T-Shirt size system (S, M, L) for consistent spacing
- Layout configuration options:
  - `LayoutItemGaps` for spacing between elements
  - `LayoutEdgeSpacing` for outer and inner padding
  - `LayoutActionSizes` for standardized button dimensions
  - `LayoutCornerRadii` for consistent corner rounding
  - `LayoutHeroSizes` for featured element dimensions
  - `LayoutScreenSizes` for responsive breakpoints
- Pre-built gap widgets:
  - `GapSmall`
  - `GapMedium`
  - `GapLarge`
- Padding widgets with inner/outer variants:
  - `PaddingInnerSmall`
  - `PaddingInnerMedium`
  - `PaddingInnerLarge`
  - `PaddingOuterSmall`
  - `PaddingOuterMedium`
  - `PaddingOuterLarge`
- EdgeInsets convenience extensions for directional padding
- Global layout configuration support
- Layout override capability for specific sections
- Modal bottom sheet height configuration

### Documentation
- Full README with usage examples
- Inline code documentation
- Example implementations of custom layouts (CompactLayout, SpaciousLayout)

[1.0.0]: https://github.com/WAMF/kiss_layout/releases/tag/v1.0.0
