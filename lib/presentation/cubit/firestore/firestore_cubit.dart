// import 'dart:convert';

// import 'package:flutter/foundation.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'firestore_state.dart';

// class FirestoreCubit extends Cubit<FirestoreState> {
//   FirestoreCubit() : super(FirestoreState.initial());

//   Future<void> addUserLog(UserLog userLog) async {
//     await state.firestore
//         .collection('user_logs')
//         .add(userLog.toMap())
//         .then((value) => debugPrint("## User log added"))
//         .catchError((error) => debugPrint("## Failed to add user: $error"));
//   }

//   Stream<QuerySnapshot<Map<String, dynamic>>> getUserSnapshots() {
//     return state.firestore.collection('users').snapshots();
//   }

//   Future<void> addTransactionLog(TransactionLog transactionLog) async {
//     await state.firestore
//         .collection('transaction_logs')
//         .doc(DateTime.now().toIso8601String())
//         .set(transactionLog.toMap())
//         .then((value) => debugPrint("## Transaction log added"))
//         .catchError(
//             (error) => debugPrint("## Failed to add transaction: $error"));
//   }

//   Future<void> getTransactions() async {
//     emit(state.copyWith(appState: AppState.loading));

//     await Future.delayed(Duration(seconds: 5));
//     // Get docs from collection reference
//     QuerySnapshot querySnapshot = await state.firestore
//         .collection('transaction_logs')
//         .where('userLoggedIn', isEqualTo: Global.userLoggedIn)
//         .orderBy('dateAndTimeCreated', descending: true)
//         .get();

//     // Get data from docs and convert map to List
//     final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

//     List<TransactionLog> transactions = [];

//     if (allData.isNotEmpty) {
//       for (var item in allData) {
//         var transaction = TransactionLog.fromJson(jsonEncode(item));

//         if (transaction.transactionType == TransactionType.DEPOSIT ||
//             transaction.transactionType == TransactionType.WITHDRAW) {
//           transactions.add(transaction);
//         }
//       }
//     }

//     emit(state.copyWith(appState: AppState.loaded, transactions: transactions));
//   }
// }
