import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../features/account/domain/model/user_model.dart';
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
  final RxBool isUserLoggedIn = false.obs;
  final Rxn<UserModel> userModel = Rxn();

  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  void initialize() async {
    checkIsUserLoggedIn();
    getUser();
  }

  void checkIsUserLoggedIn() {}

  Future<void> getUser() async {
    if (isUserLoggedIn.value) {
      if (isLoading.value) {
        showToast('Another process running');
        return;
      }
      isLoading(true);

      isLoading(false);
    }
  }

  Future<void> logout(BuildContext context) async {
    if (functionLoading.value) {
      showToast('Another process running');
      return;
    }
    functionLoading(true);
    await AuthService.instance.logout(context).then((value) {
      if (value) {
        isUserLoggedIn(false);
      }
    });
    functionLoading(false);
  }
}
