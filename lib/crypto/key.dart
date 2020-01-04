import "package:hex/hex.dart";

import 'package:semux_mobile_wallet/crypto/hash.dart';
import 'package:semux_mobile_wallet/crypto/helper.dart';
import 'package:semux_mobile_wallet/global/constant.dart';

class Key with SemuxHelper {
  final int PUBLIC_KEY_LEN = 44;
  final int PRIVATE_KEY_LEN = 48;
  final int ADDRESS_LEN = 20;
  KeyPair kp;
  var sk;
  var pk;

  Key() {
    kp = x25519.newKeyPair();
  }

  fromPrivetKey({String privetKey}) async {}

  fromPrivetKeyHD({String privetKey}) async {}

  void showPair() {
    print('Secret Key: ' + kp.secretKey.toHex());
    print('Public Key: ' + kp.publicKey.toHex());

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
    return hash.h160(stringToUint8List(testPublicFromSemuxKey));
  }
}
