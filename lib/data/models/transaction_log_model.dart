import 'dart:convert';

import '../../domain/entities/transaction_log.dart';

class TransactionLogModel extends TransactionLog {
  TransactionLogModel({
    super.amountValue,
    super.dateAndTimeCreated,
    super.userCurrentBalance,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'dateAndTimeCreated': DateTime.now().toIso8601String()});
    result.addAll({'amountValue': amountValue});
    result.addAll({'userCurrentBalance': userCurrentBalance});

    return result;
  }

  String toJson() => json.encode(toMap());

  factory TransactionLogModel.fromMap(Map<String, dynamic> map) {
    return TransactionLogModel(
      dateAndTimeCreated: map['dateAndTimeCreated'],
      amountValue: map['amountValue']?.toDouble(),
      userCurrentBalance: map['userCurrentBalance']?.toDouble(),
    );
  }

  factory TransactionLogModel.fromJson(String source) =>
      TransactionLogModel.fromMap(json.decode(source));
}
