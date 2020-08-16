class Stock {
  final DateTime dateTime;
  final double openPrice;
  final double closePrice;
  final int volume;
  final double high;
  final double low;
  final double adjClose;

  Stock(this.dateTime, this.openPrice, this.closePrice, this.volume, this.high,
      this.low, this.adjClose);
}