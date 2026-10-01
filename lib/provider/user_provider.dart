import 'package:flutter/foundation.dart';

import '../di/injection.dart';
import 'user_state.dart';
import 'user_status.dart';

class UserProvider extends ChangeNotifier {
  UserState state = UserState();

  Future<void> getUser(String userId) async {
    state = UserState(
      status: UserStatus.loading,
    );

    notifyListeners();

    try {
      final getUser = Injection.getUser();

      final user = await getUser(userId);

      state = UserState(
        status: UserStatus.success,
        user: user,
      );
    } catch (e) {
      state = UserState(
        status: UserStatus.error,
        errorMessage: e.toString(),
      );
    }

    notifyListeners();
  }
}