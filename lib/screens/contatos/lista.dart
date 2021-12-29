import 'package:flutter/material.dart';
import 'package:proj_banck/models/contatos.dart';
import 'package:proj_banck/screens/contatos/formulario.dart';

class ContactsList extends StatelessWidget {
  final List<Contatos> contatos = [];

  @override
  Widget build(BuildContext context) {
    contatos.add(Contatos(nome: 'Jairon', numeroContato: 1223));
    contatos.add(Contatos(nome: 'Wedna', numeroContato: 432));
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Contatos contato = contatos[index];
          return _ContatoItem(contato);
        },
        itemCount: contatos.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => ContatoForm(),
                ),
              )
              .then(
                (novoContato) => debugPrint(novoContato.toString()),
              );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class _ContatoItem extends StatelessWidget {
  final Contatos contato;

  const _ContatoItem(this.contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contato.nome,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          contato.numeroContato.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
