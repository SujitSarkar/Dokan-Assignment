import 'package:flutter/material.dart';
import '../model/login_model.dart';

abstract class AuthRepository {
  Future<LoginModel?> login({required String email, required String password});

  Future<bool> signup(
      {required String name,
      required String username,
      required String email,
      required String password});

  Future<bool> logout(BuildContext context);
}
