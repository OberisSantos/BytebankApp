class Contatos {
  int? id;
  final String nome;
  final int? numeroContato;

  Contatos({
    this.id,
    required this.nome,
    required this.numeroContato,
  });

  @override
  String toString() => 'Contatos(nome: $nome, numeroContato: $numeroContato)';
}
