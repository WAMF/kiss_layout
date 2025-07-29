# Kiss Layout System Documentation

## Overview

Kiss Layout is a Flutter-based design system that follows the KISS (Keep It Simple, Stupid) principle to create consistent user interfaces. The system uses a T-shirt sizing approach (Small, Medium, Large) for various design elements, making it intuitive and easy to maintain consistency across your application.

```
Layout System Overview
━━━━━━━━━━━━━━━━━━━━━

SPACING                    COMPONENTS
━━━━━━━                    ━━━━━━━━━━

Item Gaps                  Action Sizes
  L: 20dp                    L: 200×44dp
  M: 8dp                     M: 100×44dp  
  S: 4dp                     S: 44×44dp

Edge Spacing               Icon Sizes
  Outer:                     L: 24×24dp
    L: 20dp                  M: 16×16dp
    M: 12dp                  S: 12×12dp
    S: 8dp
                          Hero Sizes
  Inner:                    Fixed:
    L: 20dp                  L: 256×256dp
    M: 12dp                  M: 158×158dp
    S: 8dp                   S: 64×64dp
                           
                          Proportional:
                            L: 40% of container
                            M: 30% of container
                            S: 10% of container
```

## Core Concepts

### T-Shirt Sizing System

All measurements in the system follow a T-shirt sizing convention:
- Small (S)
- Medium (M)
- Large (L)

This consistent approach applies to spacing, padding, corner radii, and component sizes.

### Spacing System

#### Item Gaps
Used for spacing between elements:
- Large: 20dp
- Medium: 8dp
- Small: 4dp

#### Edge Spacing
The system provides two types of edge spacing:

1. Outer Edge Spacing (for container boundaries):
   - Large: 20dp all sides
   - Medium: 12dp all sides
   - Small: 8dp all sides

2. Inner Edge Spacing (for internal padding):
   - Large: 20dp all sides
   - Medium: 12dp all sides
   - Small: 8dp all sides

#### Proportional Spacing
For responsive layouts:
- Large: 5% of container size
- Medium: 3% of container size
- Small: 1% of container size

### Component Sizing

#### Action Components (Buttons, etc.)
- Large: 200×44dp
- Medium: 100×44dp
- Small: 44×44dp

#### Icon Sizes
- Large: 24×24dp
- Medium: 16×16dp
- Small: 12×12dp

#### Hero Elements
Fixed sizes:
- Large: 256×256dp
- Medium: 158×158dp
- Small: 64×64dp

Proportional sizes:
- Large: 40% of container
- Medium: 30% of container
- Small: 10% of container

### Corner Radii
- Large: 16dp
- Medium: 8dp
- Small: 4dp

## Usage Guidelines

### When to Use Each Size

#### Large
- Primary actions
- Major section separators
- Hero elements
- Prominent UI elements

#### Medium
- Secondary actions
- Standard content spacing
- General-purpose padding
- Default option for most cases

#### Small
- Tight spaces
- Dense UIs
- Minor separators
- Compact layouts

### Layout Hierarchy

The system allows for global layout settings that can be overridden for specific sections:
1. Set global layout parameters at the app root
2. Override specific sections where needed
3. Use consistent sizing within each section
