import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icone;
  final TextInputType? tipoTeclado;

  //construtor
  Editor({
    required this.controlador,
    required this.rotulo,
    required this.dica,
    this.icone,
    this.tipoTeclado,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
      child: TextField(
        //campturar valor do deposito
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: tipoTeclado != null ? tipoTeclado : TextInputType.text,
      ),
    );
  }
}
