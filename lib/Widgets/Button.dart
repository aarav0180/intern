// button style is same
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;

  Button({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color.fromRGBO(255, 77, 255, 1), Color.fromRGBO(102, 127, 255, 1), Color.fromRGBO(51,51,255, 1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: const Text(
          'Save Setting',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      );
  }
}
