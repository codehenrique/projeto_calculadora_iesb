import 'package:calculadoraiesb/componentes/botao.dart';
import 'package:calculadoraiesb/componentes/linha_botao.dart';
import 'package:flutter/material.dart';

class Teclado extends StatelessWidget {
  final void Function(String) processo;

  Teclado(this.processo);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 500,
      child: Column(
        children: <Widget>[
          LinhaBotao([
            Botao.botaoOperacao(
              texto: 'AC',
              processo: processo,
            ),
            Botao.botaoOperacao(
              texto: '⌫',
              processo: processo,
            ),
            Botao.botaoOperacao(
              texto: '√',
              processo: processo,
            ),
            Botao.botaoOperacao(
              texto: '÷',
              processo: processo,
            )
          ]),
          SizedBox(height: 1),
          LinhaBotao([
            Botao(
              texto: '7',
              processo: processo,
            ),
            Botao(
              texto: '8',
              processo: processo,
            ),
            Botao(
              texto: '9',
              processo: processo,
            ),
            Botao.botaoOperacao(
              texto: 'x',
              processo: processo,
            ),
          ]),
          SizedBox(height: 1),
          LinhaBotao([
            Botao(
              texto: '4',
              processo: processo,
            ),
            Botao(
              texto: '5',
              processo: processo,
            ),
            Botao(
              texto: '6',
              processo: processo,
            ),
            Botao.botaoOperacao(
              texto: '-',
              processo: processo,
            )
          ]),
          SizedBox(height: 1),
          LinhaBotao([
            Botao(
              texto: '1',
              processo: processo,
            ),
            Botao(
              texto: '2',
              processo: processo,
            ),
            Botao(
              texto: '3',
              processo: processo,
            ),
            Botao.botaoOperacao(
              texto: '+',
              processo: processo,
            )
          ]),
          SizedBox(height: 1),
          LinhaBotao([
            Botao.botaoOperacao(
              texto: 'x²',
              processo: processo,
            ),
            Botao(
              texto: '0',
              processo: processo,
            ),
            Botao.botaoOperacao(
              texto: '.',
              processo: processo,
            ),
            Botao.botaoOperacao(
              texto: '=',
              processo: processo,
            )
          ])
        ],
      ),
    );
  }
}
