import 'package:semux_mobile_wallet/semux/model/public_key.dart';
import 'package:semux_mobile_wallet/semux/model/secret_key.dart';

/// A pair of keys ([SecretKey] and a [PublicKey]).
class KeyPair {
  final SecretKey secretKey;
  final PublicKey publicKey;

  @override
  KeyPair(this.secretKey, this.publicKey) {
    ArgumentError.checkNotNull(secretKey, "secretKey");
    ArgumentError.checkNotNull(publicKey, "publicKey");
  }

  @override
  int get hashCode => publicKey.hashCode;

  @override
  operator ==(other) =>
      other is KeyPair &&
      publicKey == other.publicKey &&
      secretKey == other.secretKey;

  @override
  String toString() => "KeyPair(..., $publicKey)";
}
