import 'package:abu_lafy/data/mapper/mapper.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return EMPTY;
    } else {
      return this!;
    }
  }
}

//extensions on int
extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return ZERO;
    } else {
      return this!;
    }
  }
}

//extensions on bool
extension NonNullBoolean on bool? {
  bool orEmptyBool() {
    if (this == null) {
      return false;
    } else {
      return this!;
    }
  }
}

//extensions on double
extension NonNullDouble on double? {
  double orZeroDouble() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}