import 'package:flutter/material.dart';
import 'package:proj_banck/components/editor.dart';
import 'package:proj_banck/models/transferencia.dart';

class FormularioTransferencia extends StatefulWidget {
  //variavel controlador para armazenar o valor do input

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //codigo comentado para estudo
            /*Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
              child: TextField(
                //caputurar numero da conta
                controller: _controladorCampoNumeroConta,
                style: TextStyle(
                  fontSize: 24.0,
                ),
                decoration: InputDecoration(
                  labelText: 'Número da conta',
                  hintText: '0000',
                ),
                keyboardType: TextInputType.number,
              ),
            ),*/

            Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: 'Número da conta',
              dica: '00000',
            ),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: 'Valor',
                dica: '0.00',
                icone: Icons.monetization_on),
            ElevatedButton(
                onPressed: () {
                  _criaTransferencia(context);
                },
                child: Text('Confirmar')),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    //Criar variavel para receber os valores digitados
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);

    final double? valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      final transferencia = Transferencia(numeroConta, valor);
      //debugPrint('$transferencia');
      //Para retornar a tela anterior
      Navigator.pop(context, transferencia);
    }
  }
}
