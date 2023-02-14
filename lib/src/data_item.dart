class DataItem {
  final int timestamp;
  final double open;
  final double low;
  final double high;
  final double close;

  DataItem({
    required this.timestamp,
    required this.open,
    required this.low,
    required this.high,
    required this.close,
  });

  factory DataItem.fromJson(Map<String, dynamic> json) => DataItem(
    timestamp: json['timestamp'],
    open: json['open'],
    high: json['high'],
    low: json['low'],
    close: json['close'],
  );

  Map<String, dynamic> toJson() => {
    'timestamp': timestamp,
    'open': open,
    'low': low,
    'high': high,
    'close': close,
  };
}
