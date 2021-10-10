import 'dart:io';

import 'package:bravo/core/models/bravo_user.dart';
import 'package:bravo/core/services/auth/auth_service.dart';

class AuthMockService implements AuthService {
  BravoUser? get currentUser{
    return null;
  }

  Stream<BravoUser?> get userChanges {

  }

  Future<void> signup(
      String nome, String email, String password, File image) async {}

  Future<void> login(String email, String password) async {}

  Future<void> logout() async {}
}
