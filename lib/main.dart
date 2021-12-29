import 'package:flutter/material.dart';
import 'package:proj_banck/database/app_database.dart';
import 'package:proj_banck/models/contatos.dart';
import 'package:proj_banck/screens/transferencia/lista.dart';

import 'screens/contatos/formulario.dart';
import 'screens/contatos/lista.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(BytebankApp());
  //save(Contatos(nome: 'Oberis', numeroContato: 12456));
  save(Contatos(nome: 'Oberis', numeroContato: 12456)).then((id) {
    findAll().then((contatos) => debugPrint(contatos.toString()));
  });
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.dark(), usado para deixar o tema escuro

      theme: ThemeData(
        primarySwatch: Colors.green,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),

      //home: ListaTransferencias(),
      home: Dashboard(),
    );
  }
}
