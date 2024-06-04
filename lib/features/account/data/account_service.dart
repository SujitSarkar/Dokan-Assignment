import 'dart:convert';
import '../../../shared/data/data_sources/remote/api/api_endpoint_url.dart';
import '../../../shared/utils/app_toast.dart';
import '/shared/data/data_sources/remote/api/remote_imports.dart';
import '/features/account/domain/model/user_model.dart';
import '../domain/repository/account_repository.dart';

class AccountService extends ApiClient implements AccountRepository {
  AccountService._privateConstructor();
  static final AccountService instance = AccountService._privateConstructor();

  factory AccountService() => instance;

  @override
  Future<UserModel?> getUserInfo() async {
    try {
      final result = await postRequest(
          path: ApiEndpointUrl.userInfo, isTokenRequired: true);
      if (result.statusCode == 200) {
        return userModelFromJson(jsonEncode(result.data));
      }
    } catch (error) {
      showToast(error.toString());
    }
    return null;
  }

  @override
  Future<UserModel?> updateUserInfo({
    required String email,
    required String firstName,
    required String lastName,
  }) async {
    final body = {
      "email": email,
      "first_name": firstName,
      "last_name": lastName
    };
    try {
      final result = await postRequest(
          path: ApiEndpointUrl.userInfo, body: body, isTokenRequired: true);
      if (result.statusCode == 200) {
        return userModelFromJson(jsonEncode(result.data));
      }
    } catch (error) {
      showToast(error.toString());
    }
    return null;
  }
}
