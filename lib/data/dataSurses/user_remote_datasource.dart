import '../../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel?> getUser(String userId);

  Future<void> addUser(UserModel user);
}