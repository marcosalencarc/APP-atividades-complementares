import 'dart:async';

import 'package:atividades_complementares/DAO/user_dao.dart';
import 'package:atividades_complementares/model/user.dart';

class CadastroUserController{
  final UserDAO userDAO = UserDAO();

  Future<bool> insert(User usuario) async {
    try {
      userDAO.saveUser(usuario);
      print(usuario.password);
      return true;
    } catch (exception) {
      return false;
    }
  }
}