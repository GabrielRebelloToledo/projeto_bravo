import 'dart:io';

import 'package:bravo/core/models/bravo_user.dart';

abstract class AuthService {
  BravoUser? get currentUser;

  Stream<BravoUser?> get userChanges;

  Future<void> signup(
    String nome,
    String email,
    String password,
    File image,
  );
  Future<void> login(
    String email,
    String password,
  );
  Future<void> logout();
}
