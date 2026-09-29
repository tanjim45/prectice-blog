import 'package:prectice_blog/domain/entetis/user_entity.dart';
import '../models/user_model.dart';

abstract class UserRepository {
 Future<UserEntity?> getUser(String userId);

  Future<void> addUser(UserModel user);
}