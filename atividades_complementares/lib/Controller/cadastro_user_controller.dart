import 'dart:async';

import 'package:atividades_complementares/DAO/user_dao.dart';
import 'package:atividades_complementares/model/user.dart';

class CadastroUserController{
  final UserDAO userDAO = UserDAO();

  Future<bool> autenticar(User usuario) async {
    try {
      userDAO.saveUser(usuario);
      return true;
    } catch (exception) {
      return false;
    }
  }
}