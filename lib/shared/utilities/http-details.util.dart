import 'dart:convert';

import 'package:d2_remote/modules/auth/user/entities/d_user.entity.dart';
import 'package:d2_remote/modules/auth/user/queries/d_user.query.dart';
import 'package:sqflite/sqflite.dart';

class HttpDetails {
  Database? database;
  String? baseUrl;
  String? username;
  String? password;
  String? token;
  String? tokenType;
  DUser? user;
  HttpDetails({
    this.username,
    this.password,
    this.baseUrl,
    this.token,
    this.tokenType,
    this.database,
  });

  Future<HttpDetails> get() async {
    if (this.username != null &&
        this.password != null &&
        this.baseUrl != null) {
      return this;
    }

    // Data-run
    // final User? user = await UserQuery(database: database).getOne();
    final DUser? user = await DUserQuery(database: database).getOne();

    this.username = user?.username;
    this.password = user?.password;
    this.baseUrl = user?.baseUrl;
    this.token = user?.token;
    this.tokenType = user?.tokenType;

    return Future.value(this);
  }

  String get authToken {
    if (this.token != null) {
      return this.token as String;
    }
    return base64Encode(utf8.encode('${this.username}:${this.password}'));
  }

  String get authTokenType {
    switch (this.tokenType) {
      case 'bearer':
        return 'Bearer';
      default:
        return 'Basic';
    }
  }
}
