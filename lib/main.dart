import 'package:flutter/material.dart';
import 'package:statefulwidgets/calculadora/calculadora_page.dart';

void main() => runApp(GUI());

class GUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Avaliação DPM - Stateful Widgets - 2024.1",
      home: CalculadoraPage(),
    );
  }
}
