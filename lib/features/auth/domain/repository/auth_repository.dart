import 'package:flutter/material.dart';

abstract class AuthRepository {
  Future login({required String email, required String password});

  Future signup({required String email, required String password});

  Future<bool> logout(BuildContext context);
}
