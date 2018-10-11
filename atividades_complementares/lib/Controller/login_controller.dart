import 'dart:async';

import 'package:atividades_complementares/DAO/user_dao.dart';
import 'package:atividades_complementares/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  final UserDAO _userDAO = UserDAO();

  Future<User> logar(String login, String senha) async {
    User usuario = await _userDAO.getUserLogin(login);
    print(usuario);
    print(usuario.password);
    return (usuario.login == login && usuario.password == senha) ? usuario : null;

  }
}
