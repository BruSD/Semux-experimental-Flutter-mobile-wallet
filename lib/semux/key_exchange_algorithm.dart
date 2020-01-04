import 'model/key_pair.dart';
import 'model/public_key.dart';
import 'model/secret_key.dart';

abstract class KeyExchangeAlgorithm {
  String get name;

  final int keyLengthInBytes;

  const KeyExchangeAlgorithm({this.keyLengthInBytes});

  /// Generates a random [KeyPair].
  ///
  /// Optional parameter [seed] can be used to supply the bytes the key is
  /// derived from. If the implementation does not support seeds, it will throw
  /// [UnsupportedError].
  KeyPair newKeyPair() {
    return newKeyPairFromSeed(SecretKey.randomBytes(keyLengthInBytes));
  }

  /// Generates a key pair from the seed bytes.
  KeyPair newKeyPairFromSeed(SecretKey seedKey);

  /// Calculates a shared secret.
  SecretKey sharedSecret(SecretKey secretKey, PublicKey publicKey);
}
