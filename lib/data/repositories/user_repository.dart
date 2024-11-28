import 'package:flutter/foundation.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/repositories/user_repository.dart';
import '../models/user_model.dart';

class UserRepository implements IUserRepository {
  final userReference =
      FirebaseFirestore.instance.collection('users').doc('user1');

  @override
  Future<num> getAvailableBalance() async {
    num availableBalance = 0;
    try {
      availableBalance = await userReference.get().then((snapshot) {
        debugPrint('## ${snapshot.data()}');

        return UserModel.fromMap(snapshot.data() ?? {}).availableBalance;
      });

      return availableBalance;
    } catch (e) {
      debugPrint('## ${e.toString()}');
      return availableBalance;
    }
  }
}
