class Conta{
  String _agencia;
  String _conta;

  Conta(this._agencia, this._conta);

  String get agencia => _agencia;

  set agencia(String value) {
    _agencia = value;
  }

  String get conta => _conta;

  set conta(String value) {
    _conta = value;
  }
}