import 'package:atividades_complementares/constants/user_constants.dart' as userConstants;
import 'package:atividades_complementares/constants/curso_constants.dart' as cursoConstants;

/*
* @author: Marcos de Alencar Carvalho
* */

class User {

  int _id;
  String _nome;
  String _matricula;
  String _curso;
  String _email;
  String _login;
  String _password;
  int _horasProgresso;


  User({int id, String nome, String matricula, String curso, String email, String login, String password}) {
    this._id = id;
    this._nome = nome;
    this._matricula = matricula;
    this._curso = curso;
    this._email = email;
    this._login = login;
    this._password = password;
    this._horasProgresso = cursoConstants.cursoHoras[curso];
  }

  User.fromMap(Map map){
    _id = map[userConstants.idColumn];
    _nome = map[userConstants.nomeColumn];
    _matricula = map[userConstants.matriculaColumn];
    _curso = map[userConstants.cursoColumn];
    _email = map[userConstants.emailColumn];
    _login = map[userConstants.loginColumn];
    _password = map[userConstants.passwordColumn];
    _horasProgresso = cursoConstants.cursoHoras[_curso];

  }

  Map toMap() {
    Map<String, dynamic> map = {
      userConstants.nomeColumn: _nome,
      userConstants.matriculaColumn: _matricula,
      userConstants.cursoColumn: _curso,
      userConstants.emailColumn: _email,
      userConstants.loginColumn: _login,
      userConstants.passwordColumn: _password,

    };
    if(_id != null){
      map[userConstants.idColumn] = _id;
    }
    return map;
  }

  @override
  String toString() {
    return "User[Id: $_id, Nome: $_nome,Matricula: $_matricula, Curso: $_curso, Login: $_login, Email: $_email]";
  }

  // TODO: Implemnetar verificações nos setters;

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get login => _login;

  set login(String value) {
    _login = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get curso => _curso;

  set curso(String value) {
    _curso = value;
  }

  String get matricula => _matricula;

  set matricula(String value) {
    _matricula = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  int get horasProgresso => _horasProgresso;

  set horasProgresso(int value) {
    _horasProgresso = value;
  }


}
