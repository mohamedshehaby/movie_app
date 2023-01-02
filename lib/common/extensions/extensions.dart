import 'package:movie_app/common/constants.dart';

extension NonNullString on String? {
  String get orEmpty => this == null ? Constants.empty : this!;
}

extension NonNullInteger on int? {
  int get orZero => this == null ? Constants.zero : this!;
}

extension TrimString on String {
  String trimString(int n) {
    if (length >= n) {
      return '${substring(0, n)}...';
    }
    return this;
  }
}
