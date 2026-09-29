import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/user_model.dart';
import 'user_remote_datasource.dart';

class UserRemoteDataSourceImpl
    implements UserRemoteDataSource {

  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  @override
  Future<UserModel?> getUser(String userId) async {
    final doc = await _firestore
        .collection('users')
        .doc(userId)
        .get();

    if (!doc.exists) {
      return null;
    }

    return UserModel.fromMap(doc.data()!);
  }

  @override
  Future<void> addUser(UserModel user) async {
    await _firestore
        .collection('users')
        .doc(user.id)
        .set(user.toMap());
  }
}