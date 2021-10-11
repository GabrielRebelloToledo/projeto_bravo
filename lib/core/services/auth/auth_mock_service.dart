import 'dart:io';
import 'dart:async';
import 'dart:math';
import 'package:bravo/core/models/bravo_user.dart';
import 'package:bravo/core/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class AuthMockService implements AuthService {
  static final _defaultUser = BravoUser(
    id: '1234',
    name: 'Joana',
    email: 'Joana@gmail.com', 
    imageURL: 'assets/images/avatar.png',
    );

  static Map<String, BravoUser> _users = {
    _defaultUser.email: _defaultUser,
  };

  static BravoUser? _currentUser;
  static MultiStreamController<BravoUser?>? _controller;
  static final _userStream = Stream<BravoUser?>.multi((controller) {
    _controller = controller;
    _updateUser(_defaultUser);
  });

  BravoUser? get currentUser {
    return _currentUser;
  }

  Stream<BravoUser?> get userChanges {
    return _userStream;
  }

  Future<void> signup(
    String nome,
    String email,
    String password,
    File? image,
  ) async {
    final newUser = BravoUser(
      id: Random().nextDouble().toString(),
      name: nome,
      email: email,
      imageURL: image?.path ?? 'assets/images/avatar.png',
    );
    _users.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }

  Future<void> login(String email, String password) async {
    _updateUser(_users[email]);
  }

  Future<void> logout() async {
    _updateUser(null);
  }

  static void _updateUser(BravoUser? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}
