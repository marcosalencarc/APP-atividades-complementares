import 'dart:async';

import 'package:atividades_complementares/DAO/atividade_dao.dart';
import 'package:atividades_complementares/model/atividade.dart';
import 'package:atividades_complementares/model/categoria.dart';
import 'package:atividades_complementares/ui/cadastro_atividade_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
SharedPreferences prefs;
class ActivitiesPage extends StatefulWidget {
  Categoria categoria;
  @override
  _ActivitiesPageState createState() => _ActivitiesPageState();
  ActivitiesPage({this.categoria});
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  AtividadeDAO atividadeDAO = new AtividadeDAO();
  List<Atividade> atividadesCurrent = List();


  void _getAtividades() async {
    int idUser = await prefs.getInt("idUser");
    if(idUser !=null ){
      atividadesCurrent = await atividadeDAO.getAllAtividadeUser(idUser);
    }

  }
  Future<List> _getAllActivities() async {
    //int idUser = await prefs.getInt("idUser");
    return await atividadeDAO.getAllAtividades();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entregas"),

      ),
      floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CadastroAtividadePage(categoria: widget.categoria,)));
            },
            child: Icon(Icons.add),backgroundColor: Theme.of(context).primaryColor,),
      backgroundColor: Color(0xFFEFF0F1),
      body: FutureBuilder(
          future: _getAllActivities(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case (ConnectionState.waiting):
              case (ConnectionState.none):
                return  Center(
                  child: CircularProgressIndicator(
                    valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 5.0,
                  ),
                );

              default:
                print(snapshot.hasError);
                if (snapshot.hasError)
                  return Text("Erro ao carregar do banco");
                else{
                  return _createLista(context, snapshot);
                }
            }
          }),
    );
  }

  Widget _createLista(BuildContext context, AsyncSnapshot snapshot){
    if(snapshot.data.length < 1){
      return Center(child: Text("Nenhuma Atividade registrada"),);
    }else{

      atividadesCurrent = snapshot.data;
      return ListView.builder(
          padding: EdgeInsets.all(0.0),
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return _ActivityCard(context, index);
          });
    }
  }

  Widget _ActivityCard(BuildContext context, int index) {
    //print(controller.text);
    return Card(
      elevation: 2.0,
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
      child:
      ListTile(
        contentPadding: EdgeInsets.all(0.0),
        title: Stack(children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(12.0, 12.0, 0.0, 12.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(" ${atividadesCurrent[index].descricao ?? ""}",
                          style: TextStyle(
                              color: Color(0xFF555555),
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600)),
                      Spacer(flex: 1,),
                    ],
                  ),
                ]),
          ),
        ],
        ),
      ),
    );
  }
}
