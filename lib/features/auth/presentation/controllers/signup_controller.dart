import 'package:dokan/core/router/router_imports.dart';
import 'package:get/get.dart';
import '../../../../../shared/utils/app_toast.dart';
import 'package:flutter/material.dart';
import '../../data/auth_service.dart';

class SignupController extends GetxController {
  SignupController(this._authService);
  final AuthService _authService;

  final GlobalKey<FormState> signupFormKey = GlobalKey();
  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RxBool isLoading = false.obs;

  void clearData() {
    nameController.clear();
    userNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  Future<void> userSignup(BuildContext context) async {
    if (!signupFormKey.currentState!.validate()) {
      return;
    }
    if (passwordController.text != confirmPasswordController.text) {
      showToast('Password does not match');
      return;
    }
    if (isLoading.value) {
      showToast('Another process running');
      return;
    }
    isLoading(true);
    await _authService
        .signup(
      email: emailController.text.trim(),
      password: passwordController.text,
      name: nameController.text.trim(),
      username: userNameController.text.trim(),
    )
        .then((result) {
      if (result) {
        popScreen();
      }
    });
    isLoading(false);
  }
}
