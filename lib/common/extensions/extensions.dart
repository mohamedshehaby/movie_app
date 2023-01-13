import 'package:movie_app/common/constants.dart';

extension NonNullString on String? {
  String get orEmpty => this == null ? Constants.empty : this!;
}

extension NonNullInteger on int? {
  int get orZero => this == null ? Constants.intZero : this!;
}

extension NonNullDouble on double? {
  double get orZero => this == null ? Constants.doubleZero : this!;
}

extension ConvertNumToPercentageString on num? {
  String convertToPercentageString() {
    return '${((this ?? 0) * 10).toStringAsFixed(0)}%';
  }
}

extension TrimString on String {
  String trimString(int n) {
    if (length >= n) {
      return '${substring(0, n)}...';
    }
    return this;
  }
}
