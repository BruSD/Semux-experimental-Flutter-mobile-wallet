import 'package:semux_mobile_wallet/crypto/key.dart';
import 'package:semux_mobile_wallet/global/constant.dart';

class KeyGenerator {
  Key key = Key();

  Future<void> createNewPair(String seedPrivet) async {}

  Future<void> testNewPair() async {
    key.fromPrivetKey(privetKey: testSecretFromSemuxKey);
    key.showPair();

  }

  Future<void> testRestoreFromPrivetKey() async {
    key.fromPrivetKeyHD(privetKey: testSecretFromSemuxKey);

  }
}
