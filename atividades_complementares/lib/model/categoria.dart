/*
* @author: Marcos de Alencar Carvalho
* */

enum Unidade{HORAS,DIAS,SEMANA,EVENTO,QUANTIDADE,MESES,REUNIAO}

class Categoria{

  String _nome;
  String _descricao;
  double _qntAp;
  Unidade _medida;


  Categoria({String nome,String descricao, double qntAp,Unidade medida}){
    this._nome = nome;
    this._descricao = descricao;
    this._qntAp = maxAp;
    this._medida = medida;
  }

  double get maxAp => _qntAp;

  set maxAp(double value) {
    _qntAp = value;
  }

  String get descricao => _descricao;

  set descricao(String value) {
    _descricao = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Categoria &&
              runtimeType == other.runtimeType &&
              _nome == other._nome &&
              _descricao == other._descricao &&
              _qntAp == other._qntAp;

  @override
  int get hashCode =>
      _nome.hashCode ^
      _descricao.hashCode ^
      _qntAp.hashCode;

  @override
  String toString() {
    return 'Categoria{_nome: $_nome, _descricao: $_descricao, _maxAp: $_qntAp}';
  }


}
