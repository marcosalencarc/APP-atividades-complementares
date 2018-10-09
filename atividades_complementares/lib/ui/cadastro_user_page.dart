import 'package:flutter/material.dart';

class CadastroUserPage extends StatefulWidget {
  @override
  _CadastroUserPageState createState() => _CadastroUserPageState();
}

class _CadastroUserPageState extends State<CadastroUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de usuário"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(30.0, 90.0, 30.0, 10.0),
        child: Column(
          children: <Widget>[_formulario()],
        ),
      ),
    );
  }

  Widget _formulario() {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Form(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 80.0, bottom: 10.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Nome",
                  hintStyle: TextStyle(color: Colors.black12),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.perm_contact_calendar),
                  contentPadding: EdgeInsets.all(10.0)),
              style: TextStyle(color: Colors.black38, fontSize: 18.0),
              textAlign: TextAlign.start,
              validator: (value) {
                if (value.isEmpty) {
                  return "Insira o seu nome";
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Matricula",
                  hintStyle: TextStyle(color: Colors.black12),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.school),
                  contentPadding: EdgeInsets.all(10.0)),
              style: TextStyle(color: Colors.black54, fontSize: 18.0),
              textAlign: TextAlign.start,
              validator: (value) {
                if (value.isEmpty) {
                  return "Insira a sua matricula";
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.black12),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.mail),
                  contentPadding: EdgeInsets.all(10.0)),
              style: TextStyle(color: Colors.black54, fontSize: 18.0),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Login",
                  hintStyle: TextStyle(color: Colors.black12),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  contentPadding: EdgeInsets.all(10.0)),
              style: TextStyle(color: Colors.black54, fontSize: 18.0),
              textAlign: TextAlign.start,
              validator: (value) {
                if (value.isEmpty) {
                  return "Insira o seu Login";
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Senha",
                  hintStyle: TextStyle(color: Colors.black12),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  contentPadding: EdgeInsets.all(10.0)),
              style: TextStyle(color: Colors.black54, fontSize: 16.0),
              textAlign: TextAlign.start,
              obscureText: true,
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

  void _efetuarCadastro() {}
}
