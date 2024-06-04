import '/shared/data/data_sources/local/get_local_storage.dart';
import '../../../../core/constants/local_storage_key.dart';
import '/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/router/router_imports.dart';
import '../../../../shared/utils/app_toast.dart';
import '../../data/auth_service.dart';

class LoginController extends GetxController {
  LoginController(this._authService);
  final AuthService _authService;

  final RxBool isLoading = false.obs;
  final GlobalKey<FormState> loginFormKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    habdleLogin();
    super.onInit();
  }

  Future<void> habdleLogin() async {
    isLoading(true);
    final String? token =
        await LocalStorage.getData(key: LoacalStorageKey.tokenKey);
    if (token != null) {
      pushAndRemoveUntil(AppRouter.navBar);
    }
    isLoading(false);
  }

  void clearData() {
    emailController.clear();
    passwordController.clear();
  }

  Future<void> userLogin(BuildContext context) async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }
    if (isLoading.value) {
      showToast('Another process running');
      return;
    }
    isLoading(true);
    await _authService
        .login(
            email: emailController.text.trim(),
            password: passwordController.text)
        .then((result) async {
      if (result != null && result.token != null) {
        await saveToken(token: result.token!);
        showToast('Successfully logged in');
        clearData();
        pushAndRemoveUntil(AppRouter.navBar);
      }
    });
    isLoading(false);
  }

  Future<void> saveToken({required String token}) async {
    await LocalStorage.saveData(key: LoacalStorageKey.tokenKey, data: token);
  }
}
