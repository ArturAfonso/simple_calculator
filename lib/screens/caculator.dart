import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_calculator/components/display.dart';
import 'package:simple_calculator/components/keyboard.dart';
import 'package:simple_calculator/models/memory.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Memory memory = Memory();
  _onPressed(String command) {
    setState(() {
      memory.applyCommand(command);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      home: Column(
        children: [
          Display(text: memory.value),
          Keyboard(
            cb: _onPressed,
          )
        ],
      ),
    );
  }
}
