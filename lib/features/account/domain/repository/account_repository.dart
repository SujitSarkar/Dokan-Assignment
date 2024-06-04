import '../model/user_model.dart';

abstract class AccountRepository {
  Future<UserModel?> getUserInfo();

  Future<UserModel?> updateUserInfo({
    required String email,
    required String firstName,
    required String lastName,
  });
}
