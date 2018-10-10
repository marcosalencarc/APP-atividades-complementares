import 'package:atividades_complementares/model/grupo.dart';
import 'package:flutter/material.dart';
import 'package:atividades_complementares/constants/groups_constants.dart'
    as groupsConstants;

class CadastroAtividadePage extends StatefulWidget {
  @override
  _CadastroAtividadePageState createState() => _CadastroAtividadePageState();
}


class _CadastroAtividadePageState extends State<CadastroAtividadePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de usuário"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(30.0, 90.0, 30.0, 10.0),
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }

}
