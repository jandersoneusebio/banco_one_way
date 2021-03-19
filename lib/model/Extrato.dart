class Extrato {
  String _nome;
  String _cpf;
  String _operacao;
  String _agencia;
  String _conta;
  double _valor;
  String _data;
  double _saldo;
  String _contaOrigem;
  String _contaDestino;

  Extrato(this._nome, this._cpf, this._operacao, this._agencia, this._conta, this._valor, this._data, this._saldo);

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get cpf => _cpf;

  double get saldo => _saldo;

  set saldo(double value) {
    _saldo = value;
  }

  String get data => _data;

  set data(String value) {
    _data = value;
  }

  double get valor => _valor;

  set valor(double value) {
    _valor = value;
  }

  String get conta => _conta;

  set conta(String value) {
    _conta = value;
  }

  String get agencia => _agencia;

  set agencia(String value) {
    _agencia = value;
  }

  String get operacao => _operacao;

  set operacao(String value) {
    _operacao = value;
  }

  set cpf(String value) {
    _cpf = value;
  }
}