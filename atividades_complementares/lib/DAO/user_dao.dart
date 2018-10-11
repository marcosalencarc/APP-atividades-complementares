import 'package:atividades_complementares/constants/user_constants.dart' as userConstants;
import 'package:atividades_complementares/model/user.dart';

import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
/*
* @author: Marcos de Alencar Carvalho
* */
class UserDAO{
  static final UserDAO _instance = UserDAO.internal();

  factory UserDAO() => _instance;

  UserDAO.internal();

  Database _db;

  Future<Database> get db async {
    if(_db != null){
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "users.db");

    return await openDatabase(path, version: 1, onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE ${userConstants.userTable}(${userConstants.idColumn} INTEGER PRIMARY KEY, ${userConstants.nomeColumn} TEXT,${userConstants.matriculaColumn} TEXT, "
              "${userConstants.cursoColumn} TEXT , ${userConstants.emailColumn} TEXT, ${userConstants.loginColumn} TEXT,${userConstants.passwordColumn} TEXT,"
              "${userConstants.horasProgressoColumn} INTEGER)"
      );
    });
  }

  Future<User> saveUser(User user) async {
    Database dbUser = await db;
    user.id = await dbUser.insert(userConstants.userTable, user.toMap());
    return user;
  }

  Future<User> getUser(int id) async {
    Database dbUser = await db;
    List<Map> maps = await dbUser.query(userConstants.userTable,
        columns: [userConstants.idColumn, userConstants.nomeColumn, userConstants.matriculaColumn, userConstants.cursoColumn,userConstants.emailColumn,
        userConstants.loginColumn, userConstants.passwordColumn, userConstants.horasProgressoColumn],
        where: "${userConstants.idColumn} = ?",
        whereArgs: [id]);
    if(maps.length > 0){
      return User.fromMap(maps.first);
    } else {
      return null;
    }
  }
  Future<User> getUserLogin(String login) async {
    Database dbUser = await db;
    List<Map> maps = await dbUser.query(userConstants.userTable,
        columns: [userConstants.idColumn, userConstants.nomeColumn, userConstants.matriculaColumn, userConstants.cursoColumn,userConstants.emailColumn,
        userConstants.loginColumn, userConstants.passwordColumn,userConstants.horasProgressoColumn],
        where: "${userConstants.loginColumn} = ?",
        whereArgs: [login]);
    if(maps.length > 0){
      return User.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteUser(int id) async {
    Database dbUser = await db;
    return await dbUser.delete(userConstants.userTable, where: "${userConstants.idColumn} = ?", whereArgs: [id]);
  }

  Future<int> updateUser(User user) async {
    Database dbUser = await db;
    return await dbUser.update(userConstants.userTable,
        user.toMap(),
        where: "${userConstants.idColumn} = ?",
        whereArgs: [user.id]);
  }

  Future<List> getAllUsers() async {
    Database dbUser = await db;
    List listMap = await dbUser.rawQuery("SELECT * FROM ${userConstants.userTable}");
    List<User> listUser = List();
    for(Map m in listMap){
      listUser.add(User.fromMap(m));
    }
    return listUser;
  }

  Future<int> getNumber() async {
    Database dbUser = await db;
    return Sqflite.firstIntValue(await dbUser.rawQuery("SELECT COUNT(*) FROM ${userConstants.userTable}"));
  }


  Future close() async {
    Database dbUser = await db;
    dbUser.close();
  }


}