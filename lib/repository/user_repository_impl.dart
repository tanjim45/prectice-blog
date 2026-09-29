import 'package:prectice_blog/data/dataSurses/user_remote_datasource.dart';
import 'package:prectice_blog/domain/entetis/user_entity.dart';
import 'package:prectice_blog/models/user_model.dart';

import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future<UserEntity?> getUser(String userId) async {
    final userModel = await dataSource.getUser(userId);

    if (userModel == null) {
      return null;
    }

    return userModel.toEntity();
  }

  @override
  Future<void> addUser(UserModel user) async {
    await dataSource.addUser(user);
  }
}