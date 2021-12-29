import 'package:flutter/material.dart';
import 'package:proj_banck/models/transferencia.dart';
import 'package:proj_banck/screens/transferencia/formulario.dart';

class ListaTransferencias extends StatefulWidget {
  //Criar uma lista para receber as transferências
  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferâcnia'),
      ),
      body: ListView.builder(
        //povoar a lista
        itemCount: widget._transferencias
            .length, //acessar uma variavel declarada em outra classe
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //criar uma navegação e o push seria para emburrar para a pagina
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            debugPrint('$transferenciaRecebida');
            if (transferenciaRecebida != null) {
              setState(() {
                //Atualizar a minha lista de transferecia
                widget._transferencias.add(transferenciaRecebida);
              }); //setState
            }
          }); //future.then
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _tranferencia;

  const ItemTransferencia(this._tranferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_tranferencia.valor.toString()),
        subtitle: Text(_tranferencia.numeroConta.toString()),
      ),
    );
  }
}
