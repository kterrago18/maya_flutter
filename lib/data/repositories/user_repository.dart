import 'dart:convert';

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
  Future<void> updateBalance(num value) async {
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

  @override
  Future<List<TransactionLogModel>> loadTransactions() async {
    try {
      // Get docs from collection reference
      QuerySnapshot querySnapshot = await firestoreInstance
          .collection('transactions')
          .orderBy('dateAndTimeCreated', descending: true)
          .get();

      // Get data from docs and convert map to List
      final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

      List<TransactionLogModel> transactions = [];

      if (allData.isNotEmpty) {
        for (var item in allData) {
          var transaction = TransactionLogModel.fromJson(jsonEncode(item));
          transactions.add(transaction);
        }
      }

      return transactions;
    } catch (e) {
      rethrow;
    }
  }
}
