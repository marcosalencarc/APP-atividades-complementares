import 'dart:async';

import 'package:atividades_complementares/DAO/user_dao.dart';
import 'package:atividades_complementares/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  final UserDAO _userDAO = UserDAO();

  Future<User> logar(String login, String senha) async {
    _userDAO.getUserLoogin(login).then((user) {
      if (user != null) {
        if (login == user.login && senha == user.password) {
          return user;
        } else {
          return null;
        }
      } else {
        return null;
      }
    });
  }
}
