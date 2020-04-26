import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  static const VERMELHO = Colors.red;
  static const VERMELHO_CLARO = Colors.redAccent;

  final String texto;
  final Color color;
  final void Function(String) processo;

  Botao(
      {@required this.texto,
      this.color = VERMELHO_CLARO,
      @required this.processo});

  Botao.botaoOperacao(
      {@required this.texto, this.color = VERMELHO, @required this.processo});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: RaisedButton(
          color: color,
          child: Text(texto,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold)),
          onPressed: () => processo(texto)),
    );
  }
}
