import 'package:flutter/material.dart';
void main() {
  runApp(IMCCalculator());
}

class IMCCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto',
      home: IMCCalculatorScreen(),
    );
  }
}

class IMCCalculatorScreen extends StatefulWidget {
  @override
  _IMCCalculatorScreenState createState() => _IMCCalculatorScreenState();
}

class _IMCCalculatorScreenState extends State<IMCCalculatorScreen> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  double _imc = 0.0;


  void _calculateIMC() {
    final height = double.tryParse(_heightController.text) ?? 0.0;
    final weight = double.tryParse(_weightController.text) ?? 0.0;


    if (height > 0 && weight > 0) {
      final imc = weight / (height * height / 10000);
      setState(() {
        _imc = imc;
      });
    } else {
      setState(() {
        _imc = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Por favor, insira os dados necessários',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _heightController,
              decoration: InputDecoration(labelText: 'Altura (cm)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(labelText: 'Peso (kg)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateIMC,
              child: Text('Calcular IMC'),
            ),
            SizedBox(height: 20),
            Text(
              'Seu IMC é: ${_imc.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
