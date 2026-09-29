import '../domain/entetis/user_entity.dart';
import '../repository/user_repository.dart';

class GetUser {
  final UserRepository repository;

  GetUser(this.repository);

  Future<UserEntity?> call(String userId) async {
    return await repository.getUser(userId);
  }
}