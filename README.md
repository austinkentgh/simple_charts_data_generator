# simple_charts_data_generator

## How to run

Add plugin as dependency in your project and

```dart
final data = await SCDGenerator.generate(
  open: 10.1,
  low: 9.8,
  high: 11.0,
  close: 10.1,
  count: 100,
);
```
