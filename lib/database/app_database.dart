import 'dart:async';

import 'package:path/path.dart';
import 'package:proj_banck/models/contatos.dart';
import 'package:sqflite/sqflite.dart';

//metodo para criar o banco de dados
Future<Database> getDatabase() async {
  //pegar um caminho
  final String path = join(await getDatabasesPath(), 'bytebank.bd');
  return openDatabase(path, onCreate: (db, version) {
    // criar as tabelas
    db.execute(
        'CREATE TABLE contatos(id INTEGER PRIMARY KEY, name TEXT, numero_contato INTEGER)');
  }, version: 1);

  // return getDatabasesPath().then((dbPath) {
  //   final String path = join(dbPath, 'bytebank.db'); //juntar os arquivos
  //   abrir o banco de dados
  //   return openDatabase(path, onCreate: (db, version) {
  //     criar as tabelas
  //     db.execute(
  //         'CREATE TABLE contatos(id INTEGER PRIMARY KEY, name TEXT, numero_contato INTEGER)');
  //   }, version: 1);
  // });
}

//metodo para salvar o contato
Future<int> save(Contatos contato) async {
  final Database db = await getDatabase();
  final Map<String, dynamic> contatoMap = Map();
  //contatoMap['id'] = contato.id;
  contatoMap['name'] = contato.nome;
  contatoMap['numero_contato'] = contato.numeroContato;

  return db.insert('contatos', contatoMap);

  // return createDatabase().then((db) {
  //   final Map<String, dynamic> contatoMap = Map();
  //   //contatoMap['id'] = contato.id;
  //   contatoMap['name'] = contato.nome;
  //   contatoMap['numero_contato'] = contato.numeroContato;

  //   return db.insert('contatos', contatoMap);
  // });
}

//metodo para buscar todos os contatos
Future<List<Contatos>> findAll() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> ressultado = await db.query('contatos');
  final List<Contatos> contatos = [];

  for (Map<String, dynamic> map in ressultado) {
    final Contatos contato = Contatos(
      id: map['id'],
      nome: map['name'],
      numeroContato: map['numero_contato'],
    );
    contatos.add(contato);
  }
  return contatos;

  // return getDatabase().then((db) {
  //   return db.query('contatos').then((maps) {
  //     final List<Contatos> contatos = [];
  //     for (Map<String, dynamic> map in maps) {
  //       final Contatos contato = Contatos(
  //         id: map['id'],
  //         nome: map['name'],
  //         numeroContato: map['numero_contato'],
  //       );
  //       contatos.add(contato);
  //     }
  //     return contatos;
  //   });
  // });
}
