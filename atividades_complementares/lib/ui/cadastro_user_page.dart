import 'package:atividades_complementares/Controller/cadastro_user_controller.dart';
import 'package:atividades_complementares/DAO/user_dao.dart';
import 'package:atividades_complementares/model/user.dart';
import 'package:atividades_complementares/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:atividades_complementares/constants/curso_constants.dart'
    as cursoConstants;

class CadastroUserPage extends StatefulWidget {
  @override
  _CadastroUserPageState createState() => _CadastroUserPageState();
}

class _CadastroUserPageState extends State<CadastroUserPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _matriculaController = TextEditingController();
  final _emailController = TextEditingController();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  String _curso = "Curso";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de usuário"),
        actions: <Widget>[
          InkWell(
            child: Container(
              child: Icon(
                Icons.save,
                color: Colors.white,
              ),
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
            ),
            onTap: _efetuarCadastro,
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(68, 181, 215, 1.0),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
        child: Column(
          children: <Widget>[Center(child: _formulario())],
        ),
      ),
    );
  }

  Widget _formulario() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 40.0, bottom: 10.0),
            child: TextFormField(
              controller: _nomeController,
              decoration: InputDecoration(
                  hintText: "Nome",
                  fillColor: Color.fromRGBO(222, 222, 222, 0.5),
                  filled: true,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  prefixIcon: Icon(Icons.perm_contact_calendar),
                  contentPadding: EdgeInsets.all(10.0)),
              style: TextStyle(fontSize: 18.0),
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
              controller: _matriculaController,
              decoration: InputDecoration(
                  hintText: "Matricula",
                  fillColor: Color.fromRGBO(222, 222, 222, 0.5),
                  filled: true,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  prefixIcon: Icon(Icons.school),
                  contentPadding: EdgeInsets.all(10.0)),
              style: TextStyle(fontSize: 18.0),
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
              controller: _emailController,
              decoration: InputDecoration(
                  hintText: "Email",
                  fillColor: Color.fromRGBO(222, 222, 222, 0.5),
                  filled: true,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  prefixIcon: Icon(Icons.mail),
                  contentPadding: EdgeInsets.all(10.0)),
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: TextFormField(
              controller: _loginController,
              decoration: InputDecoration(
                  hintText: "Login",
                  fillColor: Color.fromRGBO(222, 222, 222, 0.5),
                  filled: true,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  prefixIcon: Icon(Icons.person),
                  contentPadding: EdgeInsets.all(10.0)),
              style: TextStyle(fontSize: 18.0),
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
              controller: _passwordController,
              decoration: InputDecoration(
                  hintText: "Senha",
                  fillColor: Color.fromRGBO(222, 222, 222, 0.5),
                  filled: true,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  contentPadding: EdgeInsets.all(10.0)),
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.start,
              obscureText: true,
              validator: (value) {
                if (value.isEmpty) {
                  return "Insira a senha";
                }
              },
            ),
          ),
          selectMenu(),
        ],
      ),
    );
  }

  Widget selectMenu() {
    return Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        height: 50.0,
        width: 300.0,
        decoration: new BoxDecoration(
            color: Color.fromRGBO(222, 222, 222, 0.5),
            border: new Border.all(color: Colors.black54, width: 1.0),
            borderRadius: new BorderRadius.circular(5.0)),
        child: DropdownButton<String>(
          hint: Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.account_balance,
                  color: Colors.black54,
                ),
                Container(width: 10.0),
                Text(
                  _curso,
                  style: TextStyle(fontSize: 16.0),
                )
              ],
            ),
          ),
          items: cursoConstants.cursos.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          onChanged: (curso) {
            setState(() {
              _curso = curso;
            });
          },
        ));
  }

  void _efetuarCadastro() {
    CadastroUserController controller = new CadastroUserController();
    if (_formKey.currentState.validate()) {
      UserDAO userDAO = new UserDAO();
      User usuario = new User(
          nome: _nomeController.text,
          matricula: _matriculaController.text,
          curso: _curso,
          email: _emailController.text,
          login: _loginController.text,
          password: _passwordController.text,
          horasProgresso: 0);
      controller.insert(usuario).then((result) {
        if (result) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Sucesso"),
                  content: Text("Usuário cadastrado"),
                  actions: <Widget>[
                    FlatButton(child: Text("OK"), onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },)
                  ],
                );
              });
        }else{
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Ocorreu um erro"),
                  content: Text("tente novamente"),
                );
              });
        }
      });
    }
  }
}
