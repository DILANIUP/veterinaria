import 'dart:convert';

import 'package:crypto/crypto.dart';

String hashPassword(String password) {
  final bytes = utf8.encode(password); // convertir la contraseña a bytes
  final digest = sha256.convert(bytes); 
  return digest.toString();
}
