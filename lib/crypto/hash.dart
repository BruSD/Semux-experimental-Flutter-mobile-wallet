import 'dart:typed_data';

import 'package:pointycastle/digests/blake2b.dart';
import 'package:pointycastle/export.dart';

import 'package:pointycastle/pointycastle.dart';

class Hash {
  final int HASH_LEN = 32;

   Uint8List h160(Uint8List input) {
    try {
      Uint8List h256Local = h256(input);

      RIPEMD160Digest digest = new RIPEMD160Digest();
      digest.update(h256Local, 0, h256Local.length);
      Uint8List out = new Uint8List(20);
      digest.doFinal(out, 0);
      return out;
    } catch (e) {}
  }

//  /**
//   * Generate the 256-bit hash.
//   *
//   * @param input
//   * @return
//   */
  Uint8List h256(Uint8List input) {
    try {
      Digest digest = Blake2bDigest();
      /* Blake2bDigest digest = new Blake2bDigest();//MessageDigest.getInstance(Constants.HASH_ALGORITHM);

            digest.update(input, 0, input.length);
*/
      return digest.process(input);
    } catch (e) {}
  }
}
