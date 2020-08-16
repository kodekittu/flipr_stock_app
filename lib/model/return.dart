import 'package:flipr_stock_app/model/retutnSingleStock.dart';

class Return {
  ReturnSingleStock YTD;
  ReturnSingleStock oneWeek;
  ReturnSingleStock oneMonth;
  ReturnSingleStock threeMonth;
  ReturnSingleStock sixMonth;
  ReturnSingleStock oneYear;
  ReturnSingleStock twoYear;
  ReturnSingleStock threeYear;

  Return(this.YTD, this.oneWeek, this.oneMonth, this.threeMonth, this.sixMonth,
      this.oneYear, this.twoYear, this.threeYear);
}