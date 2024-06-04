import 'dart:convert';
import 'package:dokan/shared/data/data_sources/local/get_local_storage.dart';

import '../domain/model/login_model.dart';
import '/shared/data/data_sources/remote/api/api_endpoint_url.dart';
import '/shared/data/data_sources/remote/api/remote_imports.dart';
import 'package:flutter/material.dart';
import '../../../../shared/utils/app_toast.dart';
import '../domain/repository/auth_repository.dart';

class AuthService extends ApiClient implements AuthRepository {
  AuthService._privateConstructor();
  static final AuthService instance = AuthService._privateConstructor();

  factory AuthService() => instance;

  @override
  Future<LoginModel?> login(
      {required String email, required String password}) async {
    try {
      final params = {
        "username": email,
        "password": password,
      };
      final header = {"Content-Type": "application/x-www-form-urlencoded"};
      final result = await postRequest(
          path: ApiEndpointUrl.login, params: params, header: header);
      return loginModelFromJson(jsonEncode(result.data));
    } catch (error) {
      showToast(error.toString());
    }
    return null;
  }

  @override
  Future<bool> signup(
      {required String name,
      required String username,
      required String email,
      required String password}) async {
    try {
      final body = {
        "name": name,
        "username": username,
        "email": email,
        "password": password,
      };
      final result =
          await postRequest(path: ApiEndpointUrl.register, body: body);
      if (result.statusCode == 200) {
        showToast(result.data['message']);
        return true;
      }
    } catch (error) {
      showToast(error.toString());
    }
    return false;
  }

  @override
  Future<bool> logout() async {
    try {
      await LocalStorage.clearAll();
      return true;
    } catch (error) {
      debugPrint(error.toString());
      showToast(error.toString());
      return false;
    }
  }
}
