import 'package:flutter/foundation.dart';

import '../di/injection.dart';
import '../domain/entetis/user_entity.dart';

class UserProvider extends ChangeNotifier {
  UserEntity? user;

  bool isLoading = false;

  String? errorMessage;

  Future<void> getUser(String userId) async {
    isLoading = true;
    errorMessage = null;

    notifyListeners();

    try {
      final getUser = Injection.getUser();

      user = await getUser(userId);
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;

    notifyListeners();
  }
}