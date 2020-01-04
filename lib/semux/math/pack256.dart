import 'dart:typed_data';
//TODO: Update this to Semux requirements keys length 48-44-20
/// Unpacks Uint8x32 into Uint16x16 (Int32List).
void unpack256(Int32List result, Uint8List packed) {
  final byteData = ByteData.view(packed.buffer, packed.offsetInBytes, 32);
  for (var i = 0; i < 16; i++) {
    result[i] = byteData.getUint16(2 * i, Endian.little);
  }
}

/// Packs Uint16x16 (Int32List) into Uint8x32.
void pack256(Uint8List result, Int32List unpacked) {
  final byteData = ByteData.view(result.buffer, result.offsetInBytes, 32);
  for (var i = 0; i < 16; i++) {
    byteData.setUint16(2 * i, unpacked[i], Endian.little);
  }
}
