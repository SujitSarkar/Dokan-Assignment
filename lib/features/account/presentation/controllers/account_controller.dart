import '/features/account/domain/model/user_model.dart';
import '/core/router/app_router.dart';
import '/core/router/router_imports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/utils/app_toast.dart';
import '../../../auth/data/auth_service.dart';
import '../../data/account_service.dart';

class AccountController extends GetxController {
  AccountController(this._accountService);
  final AccountService _accountService;

  final GlobalKey<FormState> loginFormKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final RxBool isLoading = false.obs;
  final RxBool functionLoading = false.obs;
  final Rxn<UserModel> userModel = Rxn();

  final TextEditingController email = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();

  @override
  void onInit() async {
    isLoading(true);
    await getUserInfo();
    setUserInfoToTextField();
    isLoading(false);
    super.onInit();
  }

  void setUserInfoToTextField() {
    email.text = userModel.value?.email ?? '';
    firstName.text = userModel.value?.firstName ?? '';
    lastName.text = userModel.value?.lastName ?? '';
  }

  Future<void> getUserInfo() async {
    final result = await _accountService.getUserInfo();
    if (result != null) {
      userModel.value = result;
    }
  }

  Future<void> updateUserInfo() async {
    functionLoading(true);
    final result = await _accountService.updateUserInfo(
      email: email.text.trim(),
      firstName: firstName.text.trim(),
      lastName: lastName.text.trim(),
    );
    if (result != null) {
      userModel.value = result;
      showToast('Successfully updated');
    }
    functionLoading(false);
  }

  Future<void> logout() async {
    if (functionLoading.value) {
      showToast('Another process running');
      return;
    }
    await AuthService.instance.logout().then((value) {
      pushAndRemoveUntil(AppRouter.initializer);
    });
  }
}
