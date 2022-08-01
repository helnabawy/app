part of 'utils.imports.dart';

abstract class AESDecryptor {
  static Map<String, dynamic> decrypt(String encryptedText) {
    try {
      final key = encrypt_package.Key.fromUtf8(Environment.aesKEY);
      final iv = encrypt_package.IV.fromLength(16);

      final encrypter = encrypt_package.Encrypter(encrypt_package.AES(key, mode: encrypt_package.AESMode.cbc, padding: 'PKCS7'));
      final decrypt = encrypter.decrypt64(encryptedText.trim(), iv: iv);
      return json.decode(decrypt);
    } catch (e) {
      rethrow;
    }
  }

  static List<dynamic> decryptApps(String encryptedText) {
    try {
      final key = encrypt_package.Key.fromUtf8(Environment.aesKEY);
      final iv = encrypt_package.IV.fromLength(16);

      final encrypter = encrypt_package.Encrypter(encrypt_package.AES(key, mode: encrypt_package.AESMode.cbc, padding: 'PKCS7'));
      final decrypt = encrypter.decrypt64(encryptedText.trim(), iv: iv);
      return json.decode(decrypt);
    } catch (e) {
      rethrow;
    }
  }
}
