import 'package:atividades_complementares/DAO/atividade_dao.dart';
import 'package:atividades_complementares/DAO/user_dao.dart';
import 'package:atividades_complementares/model/atividade.dart';
import 'package:atividades_complementares/model/categoria.dart';
import 'package:atividades_complementares/model/grupo.dart';
import 'package:atividades_complementares/model/user.dart';
import 'package:flutter/material.dart';
import 'package:atividades_complementares/constants/groups_constants.dart'
    as groupsConstants;
import 'package:shared_preferences/shared_preferences.dart';
SharedPreferences prefs;
class CadastroAtividadePage extends StatefulWidget {
  Categoria categoria;
  @override
  _CadastroAtividadePageState createState() => _CadastroAtividadePageState();
  CadastroAtividadePage({this.categoria});
}


class _CadastroAtividadePageState extends State<CadastroAtividadePage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _descricaoController = TextEditingController();
  final _duracaoController = TextEditingController();
  AtividadeDAO atividadeDAO = AtividadeDAO();
  UserDAO userDAO = UserDAO();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Atividade"),
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
      backgroundColor: Color.fromRGBO(196, 210, 235, 1.0),
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
              controller: _descricaoController,
              decoration: InputDecoration(
                  hintText: "Drescrição",
                  fillColor: Color.fromRGBO(222, 222, 222, 0.5),
                  filled: true,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  prefixIcon: Icon(Icons.assignment),
                  contentPadding: EdgeInsets.all(10.0)),
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.start,
              validator: (value) {
                if (value.isEmpty) {
                  return "Insira o a descrição da atividade";
                }
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10.0),

            child:
                TextFormField(
                  controller: _duracaoController,
                  decoration: InputDecoration(
                      hintText: "Duração",
                      fillColor: Color.fromRGBO(222, 222, 222, 0.5),
                      filled: true,
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      prefixIcon: Icon(Icons.access_time),
                      contentPadding: EdgeInsets.all(10.0)),
                  style: TextStyle(fontSize: 18.0),
                  keyboardType: TextInputType.numberWithOptions(),
                  textAlign: TextAlign.start,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Insira a duração da atividade";
                    }
                  },
                ),
          ),
        ],
      ),
    );
  }


  void _efetuarCadastro()async {
    prefs = await SharedPreferences.getInstance();

    Atividade atividade = Atividade(grupo: groupsConstants.groups[widget.categoria.grupo].descricao,descricao: _descricaoController.text,categoria: widget.categoria,
      duracao: int.parse(_duracaoController.text),idUser: prefs.getInt("idUser"));
    atividadeDAO.saveAtividade(atividade);
    User user = await userDAO.getUser(prefs.getInt("idUser"));
    user.horasProgresso = atividade.duracao;
    userDAO.updateUser(user);
  }
}
