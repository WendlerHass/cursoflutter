import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': [
         {'texto': 'Preto', 'pontuacao': 10},
         {'texto': 'Vermelho', 'pontuacao': 5},
         {'texto': 'Amarelo', 'pontuacao': 3},
         {'texto': 'Branco', 'pontuacao': 1},
         ],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'respostas': [
          {'texto': 'Cachorro', 'pontuacao': 10},
          {'texto': 'Cobra', 'pontuacao': 10},
          {'texto': 'Gato', 'pontuacao': 10},
          {'texto': 'Leão', 'pontuacao': 10},
          ],
      },
      {
        'texto': 'Qual é o seu país favorito?',
        'respostas': [
          {'texto': 'Brasil', 'pontuacao': 6},
          {'texto': 'Alemanha', 'pontuacao': 7},
          {'texto': 'Italia', 'pontuacao': 8},
          {'texto': 'Espanha', 'pontuacao': 10},
          ],
      }
    ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
 
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
          centerTitle: true,
        ),
        body: temPerguntaSelecionada ? Questionario(perguntas: _perguntas,
         perguntaSelecionada: _perguntaSelecionada,
          quandoResponder: _responder):
           Resultado(),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
