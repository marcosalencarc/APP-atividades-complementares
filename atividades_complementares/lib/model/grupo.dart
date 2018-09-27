import 'package:atividades_complementares/model/categoria.dart';
/*
* @author: Marcos de Alencar Carvalho
* */
class Grupo{

  int _id;
  String _descricao;
  List<Categoria> _categorias;
  int _maxAp;


  Grupo.idAndDesc({int id, String descricao}){
      this._id = id;
      this._descricao = descricao;
  }

  Grupo({int id, String descricao, List<Categoria> categorias,int maxAp}){
    Grupo.idAndDesc(id:id,descricao:descricao);
    this._id = id;
    this._descricao = descricao;
    this._categorias = categorias;
    this._maxAp = maxAp;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get descricao => _descricao;

  set descricao(String value) {
    _descricao = value;
  }

  List<Categoria> get categorias => _categorias;

  set categorias(List<Categoria> value) {
    _categorias = value;
  }

  int get maxAp => _maxAp;

  set maxAp(int value) {
    _maxAp = value;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Grupo &&
              runtimeType == other.runtimeType &&
              _id == other._id &&
              _descricao == other._descricao &&
              _categorias == other._categorias &&
              _maxAp == other._maxAp;

  @override
  int get hashCode =>
      _id.hashCode ^
      _descricao.hashCode ^
      _categorias.hashCode ^
      _maxAp.hashCode;





}