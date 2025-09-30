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
