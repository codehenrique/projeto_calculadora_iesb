import 'dart:math';

class MemoriaCalculadora {
  static const operacoes = const ['+', '-', 'x', 'x²', '÷', '√', '='];

  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String _valor = '0';
  String _operacao = '0';
  bool _limparValor = false;
  String _ultimoComando;

  void aplicarComando(String comando) {
    if (_seSubstituindoOperacao(comando)) {
      _operacao = comando;
      return;
    }

    if (comando == 'AC') {
      _limparMemoria();
    } else if (operacoes.contains(comando)) {
      _configuraOperacao(comando);
    } else {
      _adicionarDigito(comando);
    }

    _ultimoComando = comando;
  }

  _seSubstituindoOperacao(String comando) {
    return operacoes.contains(_ultimoComando) &&
        operacoes.contains(comando) &&
        _ultimoComando != '=' &&
        comando != '=';
  }

  _configuraOperacao(String novaOperacao) {
    bool simboloIgual = novaOperacao == '=';

    if (_bufferIndex == 0) {
      if (!simboloIgual) {
        _operacao = novaOperacao;
        _bufferIndex = 1;
        _limparValor = true;
      }
    } else {
      _buffer[0] = _calcular();
      _buffer[1] = 0.0;
      _valor = _buffer[0].toString();
      _valor = _valor.endsWith('.0') ? _valor.split('.')[0] : _valor;

      _operacao = simboloIgual ? null : novaOperacao;
      _bufferIndex = simboloIgual ? 0 : 1;
    }
    _limparValor = true;
  }

  _adicionarDigito(String digito) {
    final digitoPonto = digito == '.';
    final limparValor = _valor == '0' && !digitoPonto || _limparValor;

    if (digitoPonto && _valor.contains('.') && !limparValor) {
      return;
    }

    final valorVazio = digitoPonto ? '0' : '';
    final valorCorrente = limparValor ? valorVazio : _valor;
    _valor = valorCorrente + digito;
    _limparValor = false;

    _buffer[_bufferIndex] = double.tryParse(_valor) ?? 0;
  }

  _limparMemoria() {
    _valor = '0';
    _buffer.setAll(0, [0.0, 0.0]);
    _bufferIndex = 0;
    _operacao = null;
    _limparValor = false;
  }

  _calcular() {
    switch (_operacao) {
      case '+':
        return _buffer[0] + _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '÷':
        return _buffer[0] / _buffer[1];
      case '√':
        return sqrt(_buffer[0]);
      case 'x²':
        return pow(_buffer[0], _buffer[1]);
      default:
        return _buffer[0];
    }
  }

  String get valor => _valor;
}
