import 'package:dona_ya/core/authentication/models/user_register.dart';
import 'package:dona_ya/core/shared/models/user.dart';
import 'package:dona_ya/core/shared/utils/result.dart';

abstract class UserRepository {

  User? get currentUser;
  set currentUser(User? user);

  Future<Result<void, String>> save(UserRegister userRegister);
  Future<Result<void, String>> authenticate({required final String email, required final String password});
}