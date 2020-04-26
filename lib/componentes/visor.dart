import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Visor extends StatelessWidget {
  final String _texto;

  Visor(this._texto);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          color: Colors.white,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(8),
                    child: AutoSizeText(
                      _texto,
                      minFontSize: 20,
                      maxFontSize: 80,
                      maxLines: 1,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          decoration: TextDecoration.none,
                          color: Colors.red),
                    ))
              ]),
        ));
  }
}
