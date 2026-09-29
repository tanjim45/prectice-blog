import '../domain/entetis/user_entity.dart';

class UserState {
  final UserEntity? user;
  final bool isLoading;
  final String? errorMessage;

  UserState({
    this.user,
    this.isLoading = false,
    this.errorMessage,
  });
}