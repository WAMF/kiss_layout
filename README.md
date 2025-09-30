# kiss_layout

A Flutter package that helps you create consistent UI layouts using a T-Shirt size system (S, M, L). Developed by [First Mobile Digital Group SL](https://www.wearemobilefirst.com).

## Features

- 🎯 **Simple T-Shirt Sizing System** - Use small, medium, and large sizes for consistent spacing
- 🎨 **Flexible Layout System** - Easily manage padding, gaps, and corner radii
- 🌍 **Global Layout Configuration** - Set layout rules at the app level
- 🔄 **Override Capabilities** - Customize layout for specific sections
- 📱 **Responsive Design** - Handle different screen sizes with ease
- 🏗️ **KISS Principle** - Keep It Simple, Stupid! Clean and maintainable code
- 🔥 **Reduces Flutter widget parameter hell** - Gets rid of parameters and literals all over the place

## Getting Started

```bash
dart pub add kiss_layout
```

## Usage

### Basic Setup

Wrap your app with the `Layout` widget to provide global layout settings:

```dart
void main() {
  runApp(
    Layout(  // Uses LayoutData.standard by default
      child: MaterialApp(
        home: MyHomePage(),
      ),
    ),
  );
}
```

Or use one of the predefined layouts:

```dart
void main() {
  runApp(
    Layout(
      data: LayoutData.compact,  // or LayoutData.spacious
      child: MaterialApp(
        home: MyHomePage(),
      ),
    ),
  );
}
```

### Using Spacing

The package provides pre-built gap widgets for consistent spacing:

```dart
Column(
  children: [
    Text('Header'),
    const GapLarge(), // Large spacing
    Text('Content'),
    const GapMedium(), // Medium spacing
    Text('Footer'),
    const GapSmall(), // Small spacing
  ],
)
```

### Padding

Use the built-in padding widgets for consistent edge spacing:

```dart
PaddingOuterMedium(
  child: Card(
    child: PaddingInnerSmall(
      child: Text('Content'),
    ),
  ),
)
```

All padding widgets support selective padding through factory constructors:

```dart
// Apply padding only vertically (top and bottom)
PaddingInnerMedium.onlyVertical(
  child: Text('Content'),
)

// Apply padding only horizontally (left and right)
PaddingInnerLarge.onlyHorizontal(
  child: Text('Content'),
)

// Apply padding to specific sides
PaddingOuterSmall.onlyBottom(child: Text('Content'))
PaddingOuterSmall.onlyTop(child: Text('Content'))
PaddingOuterSmall.onlyLeft(child: Text('Content'))
PaddingOuterSmall.onlyRight(child: Text('Content'))

// Combine horizontal with top or bottom
PaddingInnerMedium.onlyHorizontalAndTop(child: Text('Content'))
PaddingInnerMedium.onlyHorizontalAndBottom(child: Text('Content'))
```

### Icons

Use the pre-built icon widgets for consistent iconography:

```dart
Row(
  children: [
    const IconLarge(Icons.star),      // 24dp
    const GapMedium(),
    const IconMedium(Icons.info),     // 16dp
    const GapMedium(),
    const IconSmall(Icons.close),     // 12dp
  ],
)
```

You can also customize the icon properties:

```dart
IconMedium(
  Icons.favorite,
  color: Colors.red,
  semanticLabel: 'Favorite',
)
```

Or use the layout directly for more control:

```dart
Icon(
  Icons.custom,
  size: Layout.of(context).iconSizes.large.width,
)
```

### More complex example

```dart
// Example of using Layout settings in a custom widget
class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    // Get the current Layout settings
    final layout = Layout.of(context);
    
    return Container(
      // Use corner radius from layout
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(layout.cornerRadii.medium),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: const Offset(0, 2),
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      // Use edge spacing from layout
      padding: layout.edgeSpacing.inner.medium,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          // Use item spacing from layout
          Gap(layout.itemSpacing.medium),
          Text(content),
          Gap(layout.itemSpacing.large),
          // Use action sizes from layout
          SizedBox(
            width: layout.actionSizes.medium.width,
            height: layout.actionSizes.medium.height,
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Use icon widget shorthand
                  const IconMedium(Icons.add),
                  const Gap(8),
                  const Text('Action'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

### Custom Layout Settings

### Direct Configuration

You can customize the layout settings using LayoutData:

```dart
// Use predefined layouts
Layout(
  data: LayoutData.compact,
  child: YourWidget(),
)

// Or create custom layout data
Layout(
  data: const LayoutData(
    itemSpacing: LayoutItemGaps(
      large: 24.0,
      medium: 16.0,
      small: 8.0,
    ),
    edgeSpacing: LayoutEdgeSpacing(
      outer: LayoutEdgeSpacingSizes(
        large: EdgeInsets.all(24),
        medium: EdgeInsets.all(16),
        small: EdgeInsets.all(8),
      ),
    ),
  ),
  child: YourWidget(),
)
```

### Predefined Layout Styles

The package includes built-in layout styles that you can use directly:

```dart
// Standard layout (default)
Layout(
  data: LayoutData.standard,
  child: MyWidget(),
)

// Compact layout with tighter spacing
Layout(
  data: LayoutData.compact,
  child: MyWidget(),
)

// Spacious layout with generous spacing
Layout(
  data: LayoutData.spacious,
  child: MyWidget(),
)
```

You can also use the convenience widgets:

```dart
// These widgets automatically apply their respective LayoutData
CompactLayout(
  child: MaterialApp(
    home: MyCompactPage(),
  ),
)

SpaciousLayout(
  child: MaterialApp(
    home: MySpaciousPage(),
  ),
)
```

## Additional Features

- Edge spacing (outer and inner)
- Action sizes for buttons and interactive elements
- Icon sizes for consistent iconography
- Corner radii for consistent rounding
- Hero sizes for featured elements
- Modal bottom sheet configurations
- Screen size breakpoints

## I need more sizes than S M L !!!
 - If you need more than these sizes on a single screen reconsider design or your composition of widgets.
 - Maybe a section of you app is more compact or more spacious, in this case wrap that section with a new set of S M L sizes.
 - If you really need more than 3 sizes, please open an issue and we will will consider adding more sizes.

## Guidelines

 - see [GUIDE.md](./GUIDE.md)

## Contributing

We welcome contributions! Please feel free to submit a Pull Request.

## License

```
MIT License

Copyright (c) 2024 First Mobile Digital Group SL

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
