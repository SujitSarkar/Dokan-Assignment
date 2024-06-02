import 'package:flutter/material.dart';
import '../../../../shared/utils/app_toast.dart';
import '../../../shared/data/data_sources/local/connectivity_service.dart';
import '../domain/repository/auth_repository.dart';

class AuthService implements AuthRepository {
  AuthService._privateConstructor();
  static final AuthService instance = AuthService._privateConstructor();

  factory AuthService() => instance;

  @override
  Future login({required String email, required String password}) async {
    final online = await CennectivityService.instance.isOnline();
    if (online == false) {
      showToast('No internet connection');
      return null;
    }
    try {} catch (error) {
      showToast(error.toString());
    }
    return null;
  }

  @override
  Future signup({required String email, required String password}) async {
    final online = await CennectivityService.instance.isOnline();
    if (online == false) {
      showToast('No internet connection');
      return null;
    }
    try {} catch (error) {
      showToast(error.toString());
    }
    return null;
  }

  @override
  Future<bool> logout(BuildContext context) async {
    final online = await CennectivityService.instance.isOnline();
    if (online == false) {
      showToast('No internet connection');
      return false;
    }
    try {
      return true;
    } catch (error) {
      debugPrint(error.toString());
      showToast(error.toString());
      return false;
    }
  }
}
