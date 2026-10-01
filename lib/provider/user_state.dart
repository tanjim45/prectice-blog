import '../domain/entetis/user_entity.dart';
import 'user_status.dart';

class UserState {
  final UserStatus status;
  final UserEntity? user;
  final String? errorMessage;

  UserState({
    this.status = UserStatus.initial,
    this.user,
    this.errorMessage,
  });
}