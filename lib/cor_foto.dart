import 'dart:io';

import 'package:flutter/material.dart';

class CorFoto extends StatefulWidget {
  final String foto;
  const CorFoto({super.key,required this.foto});

  @override
  State<CorFoto> createState() => _CorFotoState();
}

class _CorFotoState extends State<CorFoto> {
  List<Color> colorList = [];
  @override
  void initState() {
    super.initState();
    colorList = interpolateColor("#FFE4B5", "#FFEBCD", 10);
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Seleção da Cor"),
      
      ),
      body: Column(
        children:[ 
                     Container(
            height: 100,
            width: double.maxFinite,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: colorList, ),
            
            )),

          Card(
          elevation: 5,
           child:Image.file(File(widget.foto))),
        ]),
    );
  }

  List<Color> interpolateColor(String color1, String color2, int steps) {
  // Converter as cores hexadecimais para o formato RGB
  int r1 = int.parse(color1.substring(1, 3), radix: 16);
  int g1 = int.parse(color1.substring(3, 5), radix: 16);
  int b1 = int.parse(color1.substring(5, 7), radix: 16);
  int r2 = int.parse(color2.substring(1, 3), radix: 16);
  int g2 = int.parse(color2.substring(3, 5), radix: 16);
  int b2 = int.parse(color2.substring(5, 7), radix: 16);

  // Calcular os valores de R, G e B intermediários utilizando a interpolação linear
  double rStep = (r2 - r1) / steps;
  double gStep = (g2 - g1) / steps;
  double bStep = (b2 - b1) / steps;

  // Gerar as cores intermediárias em formato hexadecimal
  List<Color> colors = [];
  for (int i = 0; i < steps; i++) {
    int r = (r1 + (rStep * i)).round();
    int g = (g1 + (gStep * i)).round();
    int b = (b1 + (bStep * i)).round();
    Color color = Color.fromARGB(0, r, g, b);
    colors.add(color);
  }

  return colors;
}
}