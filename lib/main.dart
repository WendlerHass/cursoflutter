import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': ['Preto', 'Vermelho', 'Amarelo', 'Branco'],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'respostas': ['Cachorro', 'Cobra', 'Gato', 'Leão'],
      },
      {
        'texto': 'Qual é o seu país favorito?',
        'respostas': ['Brasil', 'Alemanha', 'Itália', 'Espanha'],
      }
    ];

    List<String> respostas =
        perguntas[_perguntaSelecionada].cast()['respostas'];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          centerTitle: true,
        ),
        body: Column(children: <Widget>[
          Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
          ...respostas.map((t) => Resposta(t, _responder)).toList(),
        ]),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
