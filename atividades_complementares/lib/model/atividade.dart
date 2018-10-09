import 'package:atividades_complementares/constants/atividade_constants.dart' as atividadeConstants;
import 'package:atividades_complementares/constants/groups_constants.dart' as groups;
import 'package:atividades_complementares/model/categoria.dart';

/*
* @author: Marcos de Alencar Carvalho
* */

class Atividade {

  int _id;
  String _descricao;
  String _grupo;
  int _duracao;
  int _idUser;
  Categoria _categoria;

  Atividade({int id, String descricao, String grupo, int duracao,int idUser, Categoria categoria}) {
    this._id = id;
    this._descricao = descricao;
    this._grupo = grupo;
    this._duracao = duracao;
    this._idUser = idUser;
    this._categoria = categoria;

  }

  Atividade.fromMap(Map map){
    _id = map[atividadeConstants.idColumn];
    _descricao = map[atividadeConstants.descricaoColumn];
    _grupo = map[atividadeConstants.grupoColumn];
    _duracao = map[atividadeConstants.duracaoColumn];
    _idUser = map[atividadeConstants.idUserColumn];
    _categoria = groups.getCategoria(map[atividadeConstants.idCategoriaColumn]);

  }

  Map toMap() {
    Map<String, dynamic> map = {
      atividadeConstants.descricaoColumn: _descricao,
      atividadeConstants.grupoColumn: _grupo,
      atividadeConstants.duracaoColumn: _duracao,
      atividadeConstants.idUserColumn: _idUser,

    };
    map[atividadeConstants.idCategoriaColumn] = _categoria.id;
    if(_id != null){
      map[atividadeConstants.idColumn] = _id;
    }
    return map;
  }

  @override
  String toString() {
    return "Ativiade[Id: $_id, Descricao: $_descricao,Grupo: $_grupo, Duracao: $_duracao${_duracao>1?"hrs":"h"}, idUser: $_idUser]";
  }

  //TODO: Implementar as verificações

  int get idUser => _idUser;

  set idUser(int value) {
    _idUser = value;
  }

  int get duracao => _duracao;

  set duracao(int value) {
    _duracao = value;
  }

  String get grupo => _grupo;

  set grupo(String value) {
    _grupo = value;
  }

  String get descricao => _descricao;

  set descricao(String value) {
    _descricao = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Atividade &&
              runtimeType == other.runtimeType &&
              _id == other._id &&
              _descricao == other._descricao &&
              _grupo == other._grupo &&
              _duracao == other._duracao &&
              _idUser == other._idUser;

  @override
  int get hashCode =>
      _id.hashCode ^
      _descricao.hashCode ^
      _grupo.hashCode ^
      _duracao.hashCode ^
      _idUser.hashCode;


}