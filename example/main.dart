import 'package:flutter/material.dart';
import 'package:flexi_border/flexi_border.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: FlexiBorder(
            borderColor: Colors.green,
            strokeWidth: 1,
            dashPattern: [1, 1],
            drawTop: true,
            drawRight: true,
            drawBottom: true,
            drawLeft: true,
            borderMode: BorderMode.full,
            child: Container(
              padding: const EdgeInsets.all(32),
              color: Colors.transparent,
              child: const Text("Flexi Border", style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
