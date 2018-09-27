import 'package:atividades_complementares/constants/atividade_constants.dart' as atividadeConstants;
import 'package:atividades_complementares/model/atividade.dart';

import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AtividadeDAO{
  static final AtividadeDAO _instance = AtividadeDAO.internal();

  factory AtividadeDAO() => _instance;

  AtividadeDAO.internal();

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
    final path = join(databasesPath, "atividades.db");

    return await openDatabase(path, version: 1, onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE ${atividadeConstants.atividadeTable}(${atividadeConstants.idColumn} INTEGER PRIMARY KEY, ${atividadeConstants.descricaoColumn} TEXT,${atividadeConstants.grupoColumn} TEXT, "
              "${atividadeConstants.duracaoColumn} INTEGER , ${atividadeConstants.idUserColumn} INTERGER)"
      );
    });
  }

  Future<Atividade> saveAtividade(Atividade atividade) async {
    Database dbAtividade = await db;
    atividade.id = await dbAtividade.insert(atividadeConstants.atividadeTable, atividade.toMap());
    return atividade;
  }

  Future<Atividade> getAtividade(int id) async {
    Database dbAtividade = await db;
    List<Map> maps = await dbAtividade.query(atividadeConstants.atividadeTable,
        columns: [atividadeConstants.idColumn, atividadeConstants.descricaoColumn, atividadeConstants.grupoColumn, atividadeConstants.duracaoColumn,atividadeConstants.idUserColumn],
        where: "${atividadeConstants.idColumn} = ?",
        whereArgs: [id]);
    if(maps.length > 0){
      return Atividade.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteAtividade(int id) async {
    Database dbAtividade = await db;
    return await dbAtividade.delete(atividadeConstants.atividadeTable, where: "${atividadeConstants.idColumn} = ?", whereArgs: [id]);
  }

  Future<int> updateAtividade(Atividade atividade) async {
    Database dbAtividade = await db;
    return await dbAtividade.update(atividadeConstants.atividadeTable,
        atividade.toMap(),
        where: "${atividadeConstants.idColumn} = ?",
        whereArgs: [atividade.id]);
  }

  Future<List> getAllAtividades() async {
    Database dbAtividade = await db;
    List listMap = await dbAtividade.rawQuery("SELECT * FROM ${atividadeConstants.atividadeTable}");
    List<Atividade> listAtividade = List();
    for(Map m in listMap){
      listAtividade.add(Atividade.fromMap(m));
    }
    return listAtividade;
  }

  Future<int> getNumber() async {
    Database dbAtividade = await db;
    return Sqflite.firstIntValue(await dbAtividade.rawQuery("SELECT COUNT(*) FROM ${atividadeConstants.atividadeTable}"));
  }


  Future close() async {
    Database dbAtividade = await db;
    dbAtividade.close();
  }


}