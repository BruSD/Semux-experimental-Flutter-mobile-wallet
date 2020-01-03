import 'dart:typed_data';

class HexCustom {
  final String PREF = "0x";

  final List<int> intToHex = "0123456789abcdef".codeUnits.map((unit) {
    return unit;
  }).toList();

  final Uint8List hexToInt = new Uint8List(128);

  HexCustom() {
    initilizeHexToInt();
  }

  initilizeHexToInt() {
    for (int i = 0; i < 16; i++) {
      if (i < 10) {
        hexToInt['0'.codeUnitAt(0) + i] = i;
      } else {
        hexToInt['a'.codeUnitAt(0) + i - 10] = i;
        hexToInt['A'.codeUnitAt(0) + i - 10] = i;
      }
    }
  }

//  /**
//   * Encodes a byte array into a hex string.
//   *
//   * @param raw
//   * @return
//   */
  String encode(Uint8List raw) {
    List<String> hex = List<String>(raw.length * 2);

    for (int i = 0; i < raw.length; i++) {
      hex[i * 2] = String.fromCharCode(intToHex[(raw[i] & 0xF0) >> 4]);
      hex[i * 2 + 1] = String.fromCharCode(intToHex[raw[i] & 0x0F]);
    }

    return hex.toString();
  }

//  /**
//   * Encodes a byte array into hex string.
//   *
//   * @param raw
//   * @return the hex encoding with 0x prefix
//   */
  String encode0x(Uint8List raw) {
    return PREF + encode(raw);
  }

//  /**
//   * Decode a hex encoded byte array.
//   *
//   * @param hex
//   * @throws CryptoException
//   *             if the input is not a valid hex string
//   * @return
//   */
  Uint8List decode(String hex) {
    RegExp regExp = new RegExp(
      r"([0-9a-fA-F]{2})",
      caseSensitive: true,
      multiLine: false,
    );

    if (hex == null || !regExp.hasMatch(hex)) {
      throw Exception();
    }

    Uint8List raw = new Uint8List((hex.length / 2).round());

    List<String> chars = hex.codeUnits.map((unit) {
      return new String.fromCharCode(unit);
    }).toList();

    for (int i = 0; i < chars.length; i += 2) {
      raw[(i / 2).round()] = (hexToInt[chars[i].codeUnitAt(0)] << 4) +
          hexToInt[chars[i + 1].codeUnitAt(0)];
    }

    return raw;
  }

  Uint8List decode0x(String hex) {
    if (hex != null && hex.startsWith(PREF)) {
      return decode(hex.substring(2));
    } else {
      return decode(hex);
    }
  }
}
