/*
* @author: Marcos de Alencar Carvalho
* */

enum Unidade{HORAS,DIAS,SEMANA,EVENTO,QUANTIDADE,MESES,REUNIAO}

class Categoria{

  int _id;
  String _nome;
  String _descricao;
  double _qntAp;
  Unidade _medida;
  int _grupo;


  Categoria({int id, String nome,String descricao, double qntAp, Unidade medida, int grupo}){
    this._id = id;
    this._nome = nome;
    this._descricao = descricao;
    this._qntAp = qntAp;
    this._medida = medida;
    this._grupo = grupo;
  }

  String get descricao => _descricao;

  set descricao(String value) {
    _descricao = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }


  double get qntAp => _qntAp;

  set qntAp(double value) {
    _qntAp = value;
  }


  int get id => _id;

  set id(int value) {
    _id = value;
  }

  Unidade get medida => _medida;

  set medida(Unidade value) {
    _medida = value;
  }

  int get grupo => _grupo;

  set grupo(int value) {
    _grupo = value;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Categoria &&
              runtimeType == other.runtimeType &&
              _id == other._id &&
              _nome == other._nome &&
              _descricao == other._descricao &&
              _qntAp == other._qntAp &&
              _medida == other._medida &&
              _grupo == other._grupo;

  @override
  int get hashCode =>
      _id.hashCode ^
      _nome.hashCode ^
      _descricao.hashCode ^
      _qntAp.hashCode ^
      _medida.hashCode ^
      _grupo.hashCode;

  @override
  String toString() {
    return 'Categoria{_nome: $_nome, _descricao: $_descricao, _qntAp: $_qntAp}';
  }


}
