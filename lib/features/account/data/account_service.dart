import '../domain/repository/account_repository.dart';

class AccountService implements AccountRepository {
  AccountService._privateConstructor();
  static final AccountService instance = AccountService._privateConstructor();

  factory AccountService() => instance;
}
