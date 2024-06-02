import 'package:get/get.dart';
import '../../../../../shared/utils/app_toast.dart';
import 'package:flutter/material.dart';
import '../../../account/presentation/controllers/account_controller.dart';
import '../../data/auth_service.dart';

class SignupController extends GetxController {
  SignupController(this._authService);
  final AuthService _authService;

  final GlobalKey<FormState> signupFormKey = GlobalKey();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RxBool isLoading = false.obs;

  void clearData() {
    nameController.clear();
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
            password: passwordController.text)
        .then((credential) async {});
    isLoading(false);
  }

  void updateUserInfo() {
    final AccountController accountController = Get.find();
    accountController.initialize();
  }
}
