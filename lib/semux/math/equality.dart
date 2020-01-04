
import 'package:collection/collection.dart';

/// Constant-time comparison of bytes.
///
/// The comparison takes a different time than normally only when:
///   * Either argument is null
///   * Lengths are non-equal
///
/// The implementation of [hash] produces a 16-bit hash by using XOR.

class ConstantTimeBytesEquality implements Equality<List<int>> {
  const ConstantTimeBytesEquality();

  @override
  int hash(List<int> e) {
    var h = 0;
    for (var i = 0; i < e.length; i++) {
      final b = e[i];
      h ^= (b << (i % 16)) ^ (b >> (16 - (i % 16)));
    }
    return h;
  }

  @override
  bool isValidKey(Object o) {
    return o is List<int>;
  }

  @override
  bool equals(List<int> left, List<int> right) {
    if (left == null || right == null || left.length != right.length) {
      return false;
    }
    var result = 0;
    for (var i = 0; i < left.length; i++) {
      result |= (left[i] ^ right[i]);
    }
    return result == 0;
  }
}
