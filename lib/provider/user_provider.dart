import 'package:flutter/foundation.dart';
import '../di/injection.dart';
import 'user_state.dart';

class UserProvider extends ChangeNotifier {
  UserState state = UserState();

  Future<void> getUser(String userId) async {
    state = UserState(
      isLoading: true,
    );

    notifyListeners();

    try {
      final getUser = Injection.getUser();

      final user = await getUser(userId);

      state = UserState(
        user: user,
        isLoading: false,
      );
    } catch (e) {
      state = UserState(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }

    notifyListeners();
  }
}