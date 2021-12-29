//para extrair o código
import 'package:flutter/material.dart';
import 'package:proj_banck/screens/contatos/lista.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashbord'),
      ),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, //alinhamento vertical
        crossAxisAlignment: CrossAxisAlignment.start, //alinhamento horizontal
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            //substituit o GestureDetector por InkWell para colocar efeito de clic
            child: Material(
              color: Theme.of(context).primaryColor,
              child: InkWell(
                //para permitir criar eventos de clic
                onTap: () {
                  //navegar para putra tela
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ContactsList(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  height: 100,
                  width: 150,
                  child: Column(
                    //colocar os alinhamentos
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Icon(
                        Icons.people,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      Text(
                        'Contatos',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
