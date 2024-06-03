import '/features/account/domain/model/user_model.dart';
import '/core/router/app_router.dart';
import '/core/router/router_imports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/local_storage_key.dart';
import '../../../../shared/data/data_sources/local/get_local_storage.dart';
import '../../../../shared/utils/app_toast.dart';
import '../../../auth/data/auth_service.dart';
import '../../../auth/domain/model/login_model.dart';
import '../../data/account_service.dart';

class AccountController extends GetxController {
  AccountController(this._accountService);
  final AccountService _accountService;

  final GlobalKey<FormState> loginFormKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final RxBool isLoading = false.obs;
  final RxBool functionLoading = false.obs;
  final Rxn<LoginModel> loginModel = Rxn();
  final Rxn<UserModel> userModel = Rxn();

  @override
  void onInit() {
    getUserFromLocal();
    getUserFromRemote();
    super.onInit();
  }

  Future<void> getUserFromLocal() async {
    isLoading(true);
    final loginString =
        await LocalStorage.getData(key: LoacalStorageKey.loginKey);
    loginModel.value = loginModelFromJson(loginString);
    isLoading(false);
  }

  Future<void> getUserFromRemote() async {
    isLoading(true);
    userModel.value = await _accountService.getUserInfo();
    isLoading(false);
  }

  Future<void> logout(BuildContext context) async {
    if (functionLoading.value) {
      showToast('Another process running');
      return;
    }
    await AuthService.instance.logout(context).then((value) {
      pushAndRemoveUntil(AppRouter.initializer);
    });
  }
}
