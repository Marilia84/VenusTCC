import 'package:flutter/material.dart';
import 'package:venus/Catalogo.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 60, 35, 65))),
      title: 'Vênus',
      home: Scaffold(body: CatalogoWidget()),
    );
  }
}
