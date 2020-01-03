import 'dart:typed_data';

import 'package:cryptography/cryptography.dart' as crypto;
import 'package:semux_mobile_wallet/crypto/hash.dart';

import 'package:semux_mobile_wallet/crypto/hex.dart';

class Key {
  final int PUBLIC_KEY_LEN = 44;
  final int PRIVATE_KEY_LEN = 48;
  final int ADDRESS_LEN = 20;
  crypto.KeyPair kp;
  var sk;
  var pk;

  Key() {
    kp = crypto.x25519.newKeyPair();
  }

  fromPrivetKey({String privetKey}) {
//    kp = crypto.x25519
//        .newKeyPairFromSeed();

  }

  void showPair() {
    print('Secret Key: ' + kp.secretKey.toString());
    print('Public Key: ' + kp.publicKey.toString());
    print('Secret Key: ' + HEX.encode(kp.secretKey.bytes));
    print('Address: ' + toAddressString());

//    print('Secret Key: ' + HEX.encode(pk));
  }

  String toAddressString() {
    return HEX.encode(toAddress());
  }

//  /**
//   * Returns the Semux address.
//   */
  List<int> toAddress() {
    Hash hash = Hash();
    return hash.h160(kp.publicKey.bytes);
  }
}
