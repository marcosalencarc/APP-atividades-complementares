import 'package:atividades_complementares/DAO/user_dao.dart';
import 'package:atividades_complementares/model/user.dart';
import 'package:atividades_complementares/ui/cadastro_atividade_page.dart';
import 'package:atividades_complementares/ui/cadastro_user_page.dart';
import 'package:atividades_complementares/ui/home_page.dart';
import 'package:atividades_complementares/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  UserDAO userDAO  = UserDAO();
  User userFind;
  if(prefs.getString("login")!=null && prefs.getString("login")!=""){
      userFind = await userDAO.getUserLogin(prefs.getString("login"));
  }
  runApp(MaterialApp(
    home:  userFind !=null ? HomePage(userlogado: userFind) : LoginPage(),
    theme: ThemeData(primaryColor: Color.fromRGBO(64, 78, 130, 1.0)),
    debugShowCheckedModeBanner: false,
  ));
}
