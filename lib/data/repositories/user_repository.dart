import 'package:flutter/foundation.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/repositories/user_repository.dart';
import '../models/transaction_log_model.dart';
import '../models/user_model.dart';

class UserRepository implements IUserRepository {
  final firestoreInstance = FirebaseFirestore.instance;

  @override
  Future<num> getAvailableBalance() async {
    num availableBalance = 0;
    try {
      availableBalance = await firestoreInstance
          .collection('users')
          .doc('user1')
          .get()
          .then((snapshot) {
        debugPrint('## ${snapshot.data()}');

        return UserModel.fromMap(snapshot.data() ?? {}).availableBalance;
      });

      return availableBalance;
    } catch (e) {
      debugPrint('## ${e.toString()}');
      return availableBalance;
    }
  }

  @override
  Future<void> addTransaction(TransactionLogModel transactionModel) async {
    try {
      await firestoreInstance
          .collection('transactions')
          .doc(DateTime.now().toIso8601String())
          .set(transactionModel.toMap())
          .then((value) => debugPrint("## Transaction log added"))
          .catchError(
              (error) => debugPrint("## Failed to add transaction: $error"));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> sendMoney(TransactionLogModel transactionModel) async {
    try {
      await addTransaction(transactionModel);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateBalance(double value) async {
    try {
      await firestoreInstance
          .collection('users')
          .doc('user1')
          .update({'availableBalance': value})
          .then((value) => debugPrint("## Transaction log added"))
          .catchError(
              (error) => debugPrint("## Failed to add transaction: $error"));
    } catch (e) {
      rethrow;
    }
  }
}
