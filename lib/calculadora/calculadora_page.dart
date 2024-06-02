import 'package:flutter/material.dart';

class CalculadoraPage extends StatefulWidget {
  @override
  _CalculadoraPageState createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nota1Controller = TextEditingController();
  final TextEditingController _nota2Controller = TextEditingController();
  final TextEditingController _nota3Controller = TextEditingController();
  String _resultadoMediaText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avaliação DPM - 2024.1"),
        backgroundColor: Colors.pinkAccent[100],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Text(
                'Calculadora de Média',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.pink[200],
                  fontWeight: FontWeight.bold,
                ),
              ),
              margin: EdgeInsets.fromLTRB(20, 30, 20, 30),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  _formulario(),
                  _botoesFormulario(context, 'Calcular Média', _calcularMedia),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  _resultadoMedia(),
                  _botoesFormulario(context, 'Apagar os Campos', _limparCampos),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _formulario() {
    return Container(
      height: 260.0,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _inputFormulario('Nome', Icons.person, 'Digite o nome', _nomeController, TextInputType.text),
          Spacer(flex: 1),
          _inputFormulario('Email', Icons.email, 'Digite o email', _emailController, TextInputType.text),
          Spacer(flex: 1),
          _formularioNotas(),
        ],
      ),
    );
  }

  Widget _formularioNotas() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(child: _inputFormulario('Nota 1', Icons.numbers, 'Nota 1', _nota1Controller, TextInputType.number)),
          Expanded(child: _inputFormulario('Nota 2', Icons.numbers, 'Nota 2', _nota2Controller, TextInputType.number)),
          Expanded(child: _inputFormulario('Nota 3', Icons.numbers, 'Nota 3', _nota3Controller, TextInputType.number)),
        ],
      ),
    );
  }

  Widget _resultadoMedia() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      height: 220.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _textResultadoTitulo('Resultado'),
          _textResultado('Nome', _nomeController.text),
          _textResultado('Email', _emailController.text),
          _textResultado('Notas:', '${_nota1Controller.text} - ${_nota2Controller.text} - ${_nota3Controller.text}'),
          _textResultado('Média:', _resultadoMediaText),
        ],
      ),
    );
  }

  Widget _inputFormulario(String label, IconData icone, String hintText, TextEditingController controller, TextInputType tipo) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(label, style: TextStyle(color: Colors.pink[200], fontSize: 16)),
          TextField(
            controller: controller,
            keyboardType: tipo,
            decoration: InputDecoration(
              prefixIcon: Icon(icone, color: Colors.pink[200]),
              labelText: hintText,
              labelStyle: TextStyle(
                color: Colors.black38,
              ),
              hintStyle: TextStyle(color: Colors.black38),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black38, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.pink, width: 1),
              ),
              floatingLabelStyle: TextStyle(
                color: Colors.pink,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textResultado(String label, String resultado) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      padding: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.pink[200], fontSize: 16)),
          SizedBox(width: 10),  // Espaço entre o label e o resultado
          Flexible(child: Text(resultado, style: TextStyle(color: Colors.black38, fontSize: 16))),
        ],
      ),
    );
  }

  Widget _textResultadoTitulo(String label) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.pink[200],
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }


  Widget _botoesFormulario(BuildContext context, String titulo, VoidCallback onPressed) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _botao(context, titulo, onPressed),
        ],
      ),
    );
  }

  Widget _botao(BuildContext context, String titulo, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
        padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
              (Set<MaterialState> states) {
            return EdgeInsets.fromLTRB(50, 10, 50, 10);
          },
        ),
      ),
      child: Text(
        titulo,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  void _calcularMedia() {
    double nota1 = double.tryParse(_nota1Controller.text) ?? 0.0;
    double nota2 = double.tryParse(_nota2Controller.text) ?? 0.0;
    double nota3 = double.tryParse(_nota3Controller.text) ?? 0.0;

    double media = (nota1 + nota2 + nota3) / 3;

    setState(() {
      _resultadoMediaText = media.toStringAsFixed(2);
    });
  }

  void _limparCampos() {
    _nomeController.clear();
    _emailController.clear();
    _nota1Controller.clear();
    _nota2Controller.clear();
    _nota3Controller.clear();

    setState(() {
      _resultadoMediaText = '';
    });
  }
}
