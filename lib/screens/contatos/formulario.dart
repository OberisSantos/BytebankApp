import 'package:flutter/material.dart';
import 'package:proj_banck/components/editor.dart';
import 'package:proj_banck/models/contatos.dart';

class ContatoForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContatoFormState();
  }
}

class ContatoFormState extends State<ContatoForm> {
  final TextEditingController _controladorCampoFullName =
      TextEditingController();
  final TextEditingController _controladorCampoNumero = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Novo Contato',
        ),
      ),
      body: Column(
        children: [
          Editor(
            controlador: _controladorCampoFullName,
            dica: '',
            rotulo: 'Full name',
          ),
          Editor(
            controlador: _controladorCampoNumero,
            dica: '',
            rotulo: 'Numero da conta',
            tipoTeclado: TextInputType.number,
          ),
          //aumentar a largura do button

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.maxFinite, //usado para ocupar todo o espaço
              child: ElevatedButton(
                onPressed: () {
                  final String name = _controladorCampoFullName.text;
                  final int? numeroContato =
                      int.tryParse(_controladorCampoNumero.text);
                  final Contatos novoContato =
                      Contatos(nome: name, numeroContato: numeroContato);
                  Navigator.pop(context, novoContato);
                },
                child: Text('Criar'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
