import 'dart:math';

import 'data_item.dart';

class SCDGenerator {
  SCDGenerator._();

  final _random = Random();

  Future<List<DataItem>> generate(
    double open,
    double low,
    double high,
    double close,
    int count,
  ) async {
    DataItem? prev;
    var isUp = true;
    return List.generate(
      count,
      (index) {
        var currUp = _randomValue(0, 10).toInt() ~/ 2 == 0;
        if (!currUp && !isUp) {
          currUp = true;
        }
        isUp = currUp;
        final random = _randomValue(.2, 0.8);
        final m = isUp ? random : -random;
        final dataItem = DataItem(
          timestamp: DateTime.now().millisecondsSinceEpoch,
          open: prev == null ? open : (isUp ? prev!.open + m : prev!.close + m),
          low: prev == null ? low : prev!.low + m,
          high: prev == null ? high : prev!.high + m,
          close:
              prev == null ? close : (isUp ? prev!.close + m : prev!.open + m),
        );
        prev = dataItem;
        return dataItem;
      },
    );
  }

  double _randomValue(double start, double end) {
    double random = _random.nextDouble();
    return start + (random * (end - start));
  }
}
