class Transferencia {
  final double valor;
  final int numeroConta;

  const Transferencia(this.numeroConta, this.valor);

  @override
  String toString() =>
      'Transferencia(valor: $valor, numeroConta: $numeroConta)';
}
