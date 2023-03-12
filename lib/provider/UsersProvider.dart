import 'package:application_1/model/sql_users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/sql_users.dart';

class UsersDbProvider extends ChangeNotifier {
  SQlDb users = SQlDb();
  List<Map> _user = [];
  List<Map> get user => _user;
  insertUser() async {
    await users.insertData(
        "INSERT INTO  Users (name,email,password,phoneNumber,image) VALUES ('tuqa','tt@gmail.com','12345','07775555','image/u1.jpg'),('Ansam','AA@gmail.com','12345','07776655','image/u2.JPG')");
  }

  Future<bool> selectUser(String namePassword) async {
    _user = await users.redData(namePassword);
    if (_user.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
