import 'package:atividades_complementares/ui/cadastro_atividade_page.dart';
import 'package:atividades_complementares/ui/cadastro_user_page.dart';
import 'package:atividades_complementares/ui/home_page.dart';
import 'package:atividades_complementares/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if(prefs.getString("login")!=null) await prefs.setString('login', "");
  if(prefs.getString("password")!=null) await prefs.setString('password', "");
  runApp(MaterialApp(
    home: LoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}
