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

[1.0.0]: https://github.com/yourusername/kiss_layout/releases/tag/v1.0.0
