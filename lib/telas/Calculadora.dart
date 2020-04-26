import 'package:calculadoraiesb/modelos/memoria_calculadora.dart';
import 'package:flutter/material.dart';
import 'package:calculadoraiesb/componentes/teclado.dart';
import 'package:calculadoraiesb/componentes/visor.dart';
import 'package:flutter/services.dart';

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final MemoriaCalculadora memoria = MemoriaCalculadora();

  _botaoPressionado(String comando) {
    setState(() {
      memoria.aplicarComando(comando);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora - IESB',
      theme: ThemeData(primarySwatch: Colors.red),
      home: Column(
        children: <Widget>[Visor(memoria.valor), Teclado(_botaoPressionado)],
      ),
    );
  }
}
