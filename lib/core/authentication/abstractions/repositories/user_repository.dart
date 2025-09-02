import 'package:dona_ya/core/shared/models/user.dart';

abstract class UserRepository {
  Future<User?> getCurrentUser();
}