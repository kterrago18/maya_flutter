import 'dart:convert';

import 'package:maya_flutter/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.availableBalance});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'availableBalance': availableBalance});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      availableBalance: map['availableBalance'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
