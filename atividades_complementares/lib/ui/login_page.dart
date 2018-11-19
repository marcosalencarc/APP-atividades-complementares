import 'dart:async';

import 'package:atividades_complementares/Controller/login_controller.dart';
import 'package:atividades_complementares/DAO/user_dao.dart';
import 'package:atividades_complementares/model/user.dart';
import 'package:atividades_complementares/ui/cadastro_user_page.dart';
import 'package:atividades_complementares/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController controller = LoginController();


  String login;
  String password;

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _mensagem = "";

  @override
  void initState() {
    super.initState();
    setState(() {
      _mensagem = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(196, 210, 235, 1.0),
          body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 10.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _formulario(),
                  RaisedButton(
                    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(18.0)),
                    onPressed: logar,
                    child: Container(
                      height: 45.0,
                      width: 200.0,
                      alignment: Alignment.center,
                      child: Text("Entrar",style: TextStyle(color: Colors.white,fontSize: 16.0,fontWeight: FontWeight.w600),
                      ),
                    ),
                    color: Theme.of(context).primaryColor,
                  ),
                  Divider(color: Colors.transparent,height: 2.0,),
                  Text(_mensagem,style: TextStyle(color: Colors.red),),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("Não possui conta ?"),
                      FlatButton(
                        padding: EdgeInsets.all(0.0),
                        child: Text(
                          "Cadastre-se",
                          style: TextStyle(
                              color: Colors.red, fontStyle: FontStyle.italic),
                        ),
                        onPressed: cadastrar,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void logar() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_formKey.currentState.validate()) {
      User usuario = await controller.logar(_loginController.text, _passwordController.text);

        if(usuario!=null){
          setState(() {
            _mensagem = "";
          });
          prefs.setString("login", usuario.login);
          prefs.setInt('idUser', usuario.id);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomePage(userlogado: usuario)));
        }else{
          setState(() {
            _mensagem = "Login e/ou senha inválidos";
          });
        }

    }


  }

  void cadastrar() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CadastroUserPage()));
  }

  Widget _formulario() {
    FocusNode pass = FocusNode();
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage('images/atividades.png'),
            width: 150.0,
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.0, bottom: 10.0),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Color.fromRGBO(222, 222, 222, 0.5),
                filled: true,
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                prefixIcon: Icon(Icons.person),
                contentPadding: EdgeInsets.all(10.0),
                hintText: "Login",
              ),
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.start,
              controller: _loginController,
              onFieldSubmitted: (String Value) {
                FocusScope.of(context).requestFocus(pass);
              },
              validator: (value) {
                if (value.isEmpty) {
                  return "Insira o login";
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Color.fromRGBO(222, 222, 222, 0.5),
                filled: true,
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                prefixIcon: Icon(Icons.lock),
                contentPadding: EdgeInsets.all(10.0),
                hintText: "Senha",
              ),
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.start,
              textCapitalization: TextCapitalization.characters,
              focusNode: pass,
              onFieldSubmitted: (String value) {
                logar();
              },
              obscureText: true,
              controller: _passwordController,
              validator: (value) {
                if (value.isEmpty) {
                  return "Insira a senha";
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
