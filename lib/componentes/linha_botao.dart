import 'package:flutter/material.dart';
import 'package:calculadoraiesb/componentes/botao.dart';

class LinhaBotao extends StatelessWidget {
  final List<Botao> botoes;

  LinhaBotao(this.botoes);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: botoes.fold(<Widget>[], (lista, botao) {
            lista.isEmpty ? lista.add(botao) : lista.addAll([SizedBox(width: 1), botao]);
            return lista;
          }),
        ));
  }
}
